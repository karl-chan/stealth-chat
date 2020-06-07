use Mix.Config

# Secret key base
config :server, ServerWeb.Endpoint,
  secret_key_base: "ty1ytVu3/4as6TyxsWP1+Kj4HXmmRfbqeg0yf3QBCxnCM2WOCQkpc5aXpdAquQFM"

# Mongodb
config :server,
       :mongo_url,
       "mongodb+srv://stealth-chat:KWCh9455@stealth-chat.kww1i.mongodb.net/stealth-chat?retryWrites=true&w=majority"

# Google APIs OAuth 2.0
config :goth,
  json: File.read!("config/secret/gapi-oauth.json")
