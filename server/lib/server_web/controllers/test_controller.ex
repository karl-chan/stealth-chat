defmodule ServerWeb.TestController do
  use ServerWeb, :controller

  def index(conn, _opts) do
    conn |> text("")
  end

  def create(conn, _opts) do
    conn |> text("")
  end
end
