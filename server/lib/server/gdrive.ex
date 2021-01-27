defmodule Server.GDrive do
  def new_conn() do
    with {:ok, token} <- Goth.Token.for_scope("https://www.googleapis.com/auth/drive") do
      GoogleApi.Drive.V3.Connection.new(token.token)
    end
  end

  def get_quota(conn) do
    GoogleApi.Drive.V3.Api.About.drive_about_get(conn,
      fields: "storageQuota"
    )
  end

  def get_root_folder(conn) do
    GoogleApi.Drive.V3.Api.Files.drive_files_get(conn, "root")
  end

  def list_files_in_folder(conn, path) do
    with {:ok, folder} <- get_folder(conn, path) do
      GoogleApi.Drive.V3.Api.Files.drive_files_list(conn,
        q: "'#{folder.id}' in parents"
      )
    end
  end

  def get_folder(conn, path) do
    with {:ok, root_folder} <- get_root_folder(conn) do
      get_folder_recursive(conn, path_to_parts(path), root_folder)
    end
  end

  defp get_folder_recursive(conn, path_parts, parent_folder) do
    case path_parts do
      [] ->
        {:ok, parent_folder}

      [head | tail] ->
        with {:ok, file_list} <-
               GoogleApi.Drive.V3.Api.Files.drive_files_list(conn,
                 q:
                   "'#{parent_folder.id}' in parents and name='#{head}' and mimeType='application/vnd.google-apps.folder'"
               ) do
          folders = file_list.files

          case folders do
            [] ->
              {:error, "Folder #{head} not found"}

            [folder] ->
              get_folder_recursive(conn, tail, folder)

            _ ->
              {:error, "Found #{length(folders)} duplicate folders of name #{head}"}
          end
        end
    end
  end

  def get_file(conn, path) do
    {dirname, basename} = {Path.dirname(path), Path.basename(path)}

    with {:ok, folder} <- get_folder(conn, dirname) do
      get_file_in_folder(conn, basename, folder)
    end
  end

  def download_file(conn, path) do
    with {:ok, file} <- get_file(conn, path) do
      GoogleApi.Drive.V3.Api.Files.drive_files_get(conn, file.id, alt: "media")
    end
  end

  defp get_file_in_folder(conn, basename, folder) do
    with {:ok, file_list} <-
           GoogleApi.Drive.V3.Api.Files.drive_files_list(conn,
             q:
               "'#{folder.id}' in parents and name='#{basename}' and mimeType!='application/vnd.google-apps.folder'"
           ) do
      case file_list.files do
        [] ->
          {:error, "File #{basename} not found"}

        [file] ->
          {:ok, file}

        _ ->
          {:error, "Found #{length(file_list.files)} duplicate files of name #{basename}"}
      end
    end
  end

  def create_folder_if_not_exists(conn, path) do
    with {:ok, root_folder} <- get_root_folder(conn) do
      create_folder_if_not_exists_recursive(conn, path_to_parts(path), root_folder)
    end
  end

  def create_folder_if_not_exists_recursive(conn, path_parts, parent_folder) do
    case path_parts do
      [] ->
        {:ok, parent_folder}

      [head | tail] ->
        res =
          case get_folder_recursive(conn, [head], parent_folder) do
            {:ok, folder} ->
              {:ok, folder}

            {:error, _} ->
              GoogleApi.Drive.V3.Api.Files.drive_files_create(conn,
                body: %GoogleApi.Drive.V3.Model.File{
                  mimeType: "application/vnd.google-apps.folder",
                  name: head,
                  parents: [parent_folder.id]
                }
              )
          end

        with {:ok, folder} <- res do
          create_folder_if_not_exists_recursive(conn, tail, folder)
        end
    end
  end

  @dialyzer {:nowarn_function, create_file: 3}
  def create_file(conn, path, body) do
    {dirname, basename} = {Path.dirname(path), Path.basename(path)}

    with {:ok, folder} <- create_folder_if_not_exists(conn, dirname) do
      case get_file_in_folder(conn, basename, folder) do
        {:ok, _} ->
          {:error, "File #{basename} already exists in folder!"}

        {:error, _} ->
          GoogleApi.Drive.V3.Api.Files.drive_files_create_iodata(
            conn,
            "multipart",
            %GoogleApi.Drive.V3.Model.File{name: basename, parents: [folder.id]},
            body
          )
      end
    end
  end

  def delete_folder(conn, path) do
    with {:ok, folder} <- get_folder(conn, path) do
      GoogleApi.Drive.V3.Api.Files.drive_files_delete(conn, folder.id)
    end
  end

  def delete_file(conn, path) do
    with {:ok, file} <- get_file(conn, path) do
      GoogleApi.Drive.V3.Api.Files.drive_files_delete(conn, file.id)
    end
  end

  defp path_to_parts(path) do
    Path.split(Path.relative_to(path, ".")) |> Enum.filter(fn part -> part != "." end)
  end
end
