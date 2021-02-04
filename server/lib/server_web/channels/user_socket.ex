defmodule ServerWeb.UserSocket do
  use Phoenix.Socket
  alias ServerWeb.Plugs.AuthPlug
  require Logger

  ## Channels
  channel "user:*", ServerWeb.UserChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  @impl true
  def connect(
        %{
          "sig_user" => sig_user,
          "sig_timestamp" => sig_timestamp,
          "sig_hash" => sig_hash
        },
        socket,
        _connect_info
      ) do
    try do
      AuthPlug.verify(sig_user, sig_timestamp, sig_hash, sig_timestamp)
    rescue
      err ->
        Logger.error("User: " <> sig_user <> " rejected from socket.\n" <> Kernel.inspect(err))
        :error
    else
      _ ->
        Logger.info("User connected to socket: " <> sig_user)
        {:ok, assign(socket, :user_id, sig_user)}
    end
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     ServerWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  @impl true
  def id(socket), do: "user_socket:#{socket.assigns.user_id}"
end
