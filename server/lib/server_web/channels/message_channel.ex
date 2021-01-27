defmodule ServerWeb.MessageChannel do
  def join("message:" <> _id, _payload, socket) do
    {:ok, socket}
  end
end
