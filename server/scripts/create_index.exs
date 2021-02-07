# Usage: mix run -r scripts/create_index.exs

defmodule Scripts.CreateIndex do
  alias Server.User
  alias Server.Events.ServerEvents

  def main() do
    User.create_index()
    ServerEvents.create_index()
  end
end

Scripts.CreateIndex.main()
