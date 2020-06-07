defmodule Server.Cache do
  import Cachex.Spec
  alias Server.User

  def config() do
    %{
      id: :user_cache_id,
      start: {Cachex, :start_link, [:user_cache, [fallback: fallback(default: &load_user/1)]]}
    }
  end

  def get_public_key(user) do
    get_user(user)
  end

  defp get_user(user) do
    Cachex.get(:user_cache, user)
  end

  defp put_user(user, public_key) do
    Cachex.put(:user_cache, user, public_key)
  end

  defp load_user(user) do
    with {:ok, public_key} <- User.download_public_key(user) do
      put_user(user, public_key)
    end
  end
end
