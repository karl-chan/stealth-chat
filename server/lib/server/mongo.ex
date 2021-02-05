defmodule Server.Mongo do
  @mongo_url Application.get_env(:server, :mongo_url)

  def spec() do
    {Mongo, [name: :mongo, url: @mongo_url, pool_size: 100]}
  end
end
