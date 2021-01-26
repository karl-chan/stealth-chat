defmodule ServerWeb.Plugs.AuthPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias ServerWeb.Router
  import Mock

  @opts Router.init([])

  setup_all do
    {:ok, private_key} = ExPublicKey.generate_key()
    {:ok, public_key} = ExPublicKey.public_key_from_private_key(private_key)
    {:ok, public_key_pem} = ExPublicKey.pem_encode(public_key)
    {:ok, private_key: private_key, public_key: public_key, public_key_pem: public_key_pem}
  end

  test "missing signature" do
    conn =
      :get
      |> conn("/test", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 401
    assert conn.resp_body == "Missing signature"
  end

  test "Timestamp too old" do
    conn =
      :get
      |> conn("/test", "")
      |> put_req_header("sig-user", "test")
      |> put_req_header("sig-timestamp", "0")
      |> put_req_header("sig-hash", "1234567890")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 401
    assert conn.resp_body |> String.starts_with?("Timestamp too old")
  end

  test "Signature mismatch", state do
    with_mock Server.Caches.UserCache,
      get_public_key: fn _ ->
        state[:public_key] |> ExPublicKey.pem_encode()
      end do
      timestamp = DateTime.utc_now() |> DateTime.to_unix() |> Integer.to_string()

      conn =
        :get
        |> conn("/test", "")
        |> put_req_header("sig-user", "test")
        |> put_req_header("sig-timestamp", timestamp)
        |> put_req_header("sig-hash", Base.encode64("wrong hash"))
        |> Router.call(@opts)

      assert conn.state == :sent
      assert conn.status == 401
      assert conn.resp_body == "Signature does not match!"
    end
  end

  test "Auth success (simple get)", state do
    with_mock Server.Caches.UserCache,
      get_public_key: fn _ ->
        state[:public_key] |> ExPublicKey.pem_encode()
      end do
      timestamp = DateTime.utc_now() |> DateTime.to_unix() |> Integer.to_string()
      body = ""
      {:ok, sig} = "#{timestamp}|#{body}" |> ExPublicKey.sign(state[:private_key])
      hash = Base.encode64(sig)

      conn =
        :get
        |> conn("/test", "")
        |> put_req_header("sig-user", "test")
        |> put_req_header("sig-timestamp", timestamp)
        |> put_req_header("sig-hash", hash)
        |> Router.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
    end
  end

  test "Auth success (get with params)", state do
    with_mock Server.Caches.UserCache,
      get_public_key: fn _ ->
        state[:public_key] |> ExPublicKey.pem_encode()
      end do
      params = %{foo: "bar"}
      timestamp = DateTime.utc_now() |> DateTime.to_unix() |> Integer.to_string()
      body = ""
      {:ok, sig} = "#{timestamp}|#{body}" |> ExPublicKey.sign(state[:private_key])
      hash = Base.encode64(sig)

      conn =
        :get
        |> conn("/test", params)
        |> put_req_header("sig-user", "test")
        |> put_req_header("sig-timestamp", timestamp)
        |> put_req_header("sig-hash", hash)
        |> Router.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
    end
  end

  test "Auth success (post with params)", state do
    with_mock Server.Caches.UserCache,
      get_public_key: fn _ ->
        state[:public_key] |> ExPublicKey.pem_encode()
      end do
      params = Poison.encode!(%{foo: "bar"})
      timestamp = DateTime.utc_now() |> DateTime.to_unix() |> Integer.to_string()
      body = params
      {:ok, sig} = "#{timestamp}|#{body}" |> ExPublicKey.sign(state[:private_key])
      hash = Base.encode64(sig)

      conn =
        :post
        |> conn("/test", params)
        |> put_req_header("sig-user", "test")
        |> put_req_header("sig-timestamp", timestamp)
        |> put_req_header("sig-hash", hash)
        |> Router.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
    end
  end
end
