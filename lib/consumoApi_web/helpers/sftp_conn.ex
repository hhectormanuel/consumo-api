defmodule ConsumoApiWeb.Helpers.SftpConn do

  alias ConsumoApiWeb.Helpers.FilesPath
  alias ConsumoApiWeb.Helpers.CsvConverter
  alias SFTPClient

  def connection() do
    data = [
      host: "test.rebex.net",
      user: "demo",
      password: "password",
      port: 22
    ]
    case SFTPClient.connect(data) do
      {:error, error} -> {:error, error}
      {:ok, conn} -> conn
    end
  end


  def disconnect(conn) do
    SFTPClient.disconnect(conn)
  end

  def get_files(conn, path) do
    case SFTPClient.list_dir(conn, path) do
      {:ok, files_list} -> files_list
      {:error, _error} -> []
    end
    |> Enum.map(fn file -> path <> file end)
  end

  def get_files_from_paths(conn, paths) do
    Enum.reduce(paths, [], fn path, acc ->
      case SFTPClient.list_dir(conn, path) do
        {:ok, files_list} ->
          Enum.map(files_list, fn file -> path <> file end) ++ acc
        {:error, _error} -> []
      end
    end)
  end

  def read_files(_conn, []), do: {:error, "no files found"}

  def read_files(conn, paths) do
    Enum.reduce(paths , [], fn path, acc ->
      {:ok, content} = SFTPClient.read_file(conn, path)
      CsvConverter.convert_csv(content, "|", false, FilesPath.get_type_from_path(path)) ++ acc
    end)
    |> List.flatten()
  end
end
