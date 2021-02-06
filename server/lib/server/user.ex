defmodule Server.User do
  require Logger

  @coll "users"

  def show(id) do
    Mongo.find_one(:mongo, @coll, %{id: id}, projection: %{_id: 0})
  end

  def create(id, public_key) do
    Logger.info("Registering user #{id}...")

    res =
      if already_exists(id) do
        {:error, "User #{id} is already taken!"}
      else
        case Mongo.insert_one(:mongo, @coll, %{"id" => id, "publicKey" => public_key}) do
          {:ok, _} ->
            {:ok, "Registered user #{id} successfully!"}

          {:error, _} ->
            {:error, "Failed to register user #{id}. Please try again later."}
        end
      end

    case res do
      {:ok, info} ->
        Logger.info(info)

      {:error, err} ->
        Logger.error(err)
    end

    res
  end

  def delete(id) do
    Logger.info("Deleting user #{id}...")

    case Mongo.delete_one(:mongo, @coll, %{id: id}) do
      {:ok, %Mongo.DeleteResult{deleted_count: 1}} ->
        msg = "User #{id} deleted!"
        Logger.info(msg)
        {:ok, msg}

      {:ok, _} ->
        msg = "User #{id} does not exist!"
        Logger.warn(msg)
        {:error, msg}

      {:error, err} ->
        Logger.error(err)
        {:error, err}
    end
  end

  defp already_exists(id) do
    show(id) != nil
  end
end
