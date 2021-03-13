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

# Firebase Cloud Messaging
config :pigeon, :fcm,
  fcm_default: %{
    key:
      "AAAA7VAE6Z4:APA91bFPEMxDAZMMHuGsNAl3dUAjoCwGzxcs0UrZ5qGyG67mwhwhi4-ChGO8S9vVhDtz5Z2Sfe30XXZbb_exT-aMJ_tpY-tvGV3jPyf4i1kFvzfDZWb0FfZpY7eeJbRJYiQw71AlncEq"
  }
