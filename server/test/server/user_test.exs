defmodule Server.UserTest do
  use ExUnit.Case
  alias Server.User

  setup_all do
    cleanup()
    on_exit(&cleanup/0)
  end

  defp cleanup() do
    User.delete("test")
  end

  test "show non-existent user" do
    assert {:error, "User test does not exist!"} == User.show("test")
  end

  test "must not create test user" do
    assert {:error, "Username test is reserved!"} == User.create("test", "public_key")
  end

  test "fails to delete non-existent user" do
    assert {:error, "User test does not exist!"} == User.delete("test")
  end

  test "create, show and delete user" do
    assert {:ok, "Registered user test successfully!"} == User.create("test", "public_key", true)
    {:ok, user} = User.show("test")
    assert match?(%{"id" => "test", "publicKey" => "public_key"}, user)
    assert {:ok, "User test deleted!"} == User.delete("test")
  end
end
