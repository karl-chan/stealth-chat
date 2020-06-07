defmodule Server.Mongo do
  @mongo_url Application.get_env(:server, :mongo_url)

  def config() do
    %{
      id: :mongo_id,
      start: {Mongo, :start_link, [[name: :mongo, url: @mongo_url, pool_size: 3]]}
    }
  end
end
