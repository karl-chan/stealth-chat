defmodule Server.GDriveTest do
  use ExUnit.Case
  alias Server.GDrive

  setup_all do
    state = [conn: GDrive.new_conn()]

    cleanup(state)
    on_exit(fn -> cleanup(state) end)

    {:ok, state}
  end

  defp cleanup(state) do
    conn = state[:conn]
    GDrive.delete_folder(conn, "test")
    GDrive.delete_file(conn, "test")
  end

  test "create / delete folder (simple)", state do
    conn = state[:conn]

    {:ok, test_folder} = GDrive.create_folder_if_not_exists(conn, "test")
    {:ok, retrieved_test_folder} = GDrive.get_folder(conn, "test")
    assert retrieved_test_folder.id == test_folder.id

    {:ok, _} = GDrive.delete_folder(conn, "test")
    {:error, _} = GDrive.get_folder(conn, "test")
  end

  test "create / get / download / delete file", state do
    conn = state[:conn]

    {:ok, _} = GDrive.create_file(conn, "test", "hello world")
    {:ok, file_contents} = GDrive.download_file(conn, "test")
    assert file_contents == "hello world"

    {:ok, _} = GDrive.delete_file(conn, "test")
    {:error, _} = GDrive.get_file(conn, "test")
  end

  test "create / delete folder (nested)", state do
    conn = state.conn

    {:ok, nested_folder} = GDrive.create_folder_if_not_exists(conn, "test/nested")
    {:ok, retrieved_nested_folder} = GDrive.get_folder(conn, "test/nested")
    {:ok, retrieved_test_folder} = GDrive.get_folder(conn, "test")
    assert retrieved_nested_folder.id == nested_folder.id
    assert retrieved_test_folder != nested_folder.id

    {:ok, _} = GDrive.delete_folder(conn, "test")
    {:error, _} = GDrive.get_folder(conn, "test/nested")
    {:error, _} = GDrive.get_folder(conn, "test")
  end
end
