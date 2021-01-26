defmodule Server.Caches.UserCache do
  alias Server.User

  def spec() do
    {Cachex, [name: :user_cache]}
  end

  def get_public_key(id) do
    with {:ok, user} <- get_user(id) do
      {:ok, user["publicKey"]}
    end
  end

  defp get_user(id) do
    res =
      Cachex.fetch(:user_cache, id, fn id ->
        case User.show(id) do
          nil -> {:ignore, "User does not exist: #{id}"}
          user -> {:commit, user}
        end
      end)

    case res do
      {:ignore, err} -> err
      {_, user} -> {:ok, user}
    end
  end
end
