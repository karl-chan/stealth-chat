defmodule ServerWeb.Plugs.AuthPlug do
  import Phoenix.Controller
  import Plug.Conn
  alias Server.Caches.UserCache

  def init(default), do: default

  def call(conn, _default) do
    sig_user = get_req_header(conn, "sig-user") |> List.first()
    sig_timestamp = get_req_header(conn, "sig-timestamp") |> List.first()
    sig_hash = get_req_header(conn, "sig-hash") |> List.first()
    {:ok, body, _conn} = read_body(conn)

    msg = "#{sig_timestamp}|#{body}"

    try do
      verify(sig_user, sig_timestamp, sig_hash, msg)
    rescue
      err ->
        conn |> put_status(:unauthorized) |> text(err) |> halt()
    else
      _ -> conn
    end
  end

  def verify(sig_user, sig_timestamp, sig_hash, msg) do
    if sig_user == nil or sig_timestamp == nil or sig_hash == nil do
      raise("Missing signature")
    end

    timestamp =
      sig_timestamp
      |> Integer.parse()
      |> Kernel.elem(0)
      |> DateTime.from_unix!()

    now = DateTime.utc_now()

    if abs(DateTime.diff(now, timestamp)) > 60 do
      raise("Timestamp too old: #{timestamp} compared to now: #{now}!")
    end

    {:ok, public_key_pem} = UserCache.get_public_key(sig_user)
    {:ok, public_key} = ExPublicKey.loads(public_key_pem)
    {:ok, sig_valid} = ExPublicKey.verify(msg, Base.decode64!(sig_hash), public_key)

    if not sig_valid do
      raise("Signature does not match!")
    end
  end
end
