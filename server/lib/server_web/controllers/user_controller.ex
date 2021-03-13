defmodule ServerWeb.UserController do
  use ServerWeb, :controller
  alias Server.User

  def show(conn, %{"id" => id}) do
    conn |> json(User.show(id))
  end

  def create(conn, %{"id" => id, "publicKey" => public_key, "fcmToken" => fcm_token}) do
    case User.create(id, public_key, fcm_token) do
      {:ok, info} -> conn |> put_status(:created) |> text(info)
      {:error, err} -> conn |> put_status(:unprocessable_entity) |> text(err)
    end
  end

  def delete(conn, %{"id" => id}) do
    case User.delete(id) do
      {:ok, info} -> conn |> put_status(:ok) |> text(info)
      {:error, err} -> conn |> put_status(:not_found) |> text(err)
    end
  end
end
