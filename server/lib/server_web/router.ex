defmodule ServerWeb.Router do
  use ServerWeb, :router
  alias Server.Cache
  require Logger

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  defp verify_user_signature(conn, _opts) do
    sig_user = get_req_header(conn, "sig_user") |> List.first()
    sig_timestamp = get_req_header(conn, "sig_timestamp") |> List.first()
    sig_hash = get_req_header(conn, "sig_hash") |> List.first()
    body = conn.body_params

    try do
      if sig_user == nil or sig_timestamp == nil or sig_hash == nil do
        throw("Missing signature")
      end

      timestamp =
        sig_timestamp
        |> Integer.parse()
        |> Kernel.elem(0)
        |> DateTime.from_unix!()

      now = DateTime.utc_now()

      if abs(DateTime.diff(now, timestamp)) > 60 do
        throw("Timestamp too old: #{timestamp} compared to now: #{now}!")
      end

      msg = "#{sig_timestamp}|#{body}"
      user_public_key = Cache.get_public_key(sig_user)
      {:ok, sigvalid} = ExPublicKey.verify(msg, Base.decode64!(sig_hash), user_public_key)

      if not sigvalid do
        throw("Signature does not match!")
      end
    catch
      err ->
        conn |> put_status(:unauthorized) |> text(err) |> halt()
    else
      _ -> conn
    end
  end

  scope "/", ServerWeb do
    pipe_through :browser

    # get "/", PageController, :index
  end

  scope "/api", ServerWeb do
    pipe_through :api

    scope "/" do
      # unauthenticated routes
      resources "/user", UserController, only: [:create]
    end

    scope "/" do
      # authenticated routes
      pipe_through :verify_user_signature

      resources "/user", UserController, only: [:show, :delete]
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ServerWeb.Telemetry
    end
  end
end
