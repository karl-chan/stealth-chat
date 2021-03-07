use Mix.Config

config :server, ServerWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "stealth-chat.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  render_errors: [view: ServerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Server.PubSub,
  live_view: [signing_salt: "DvkFpRe0"]
