defmodule ConsumoApiWeb.Resolvers.DataResolver do
  alias ConsumoApiWeb.Helpers.FilesPath
  alias ConsumoApiWeb.Helpers.SftpConn

  @today FilesPath.get_today_date()

  def all_data(_root, _args, _info) do
    {:ok, FilesPath.get_files_prueba(["/home/hector/Desktop/docs/bss-cbs_data/1.add"], ["|", false])}
  end

  def all_data_real(_root, _args, _info) do
    {:ok, FilesPath.get_data("data", ["|", false], FilesPath.get_today_date())}
  end

  def all_data_real2(_root, _args, _info) do
    path = "/efs_sftp_altan/195/cdrs/bss-cbs_data/#{@today}"
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, path)
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end

  def find_by_date(_parent, %{cdr_batch_id: cdr_batch_id}, _resolution) do
    condition =
      FilesPath.get_files_prueba("hola", ["|", false])
      |> Enum.find(nil, fn map ->
      map.cdr_batch_id== cdr_batch_id end)
    case condition do
      nil ->
        {:error, "File Voice with date #{cdr_batch_id} not found"}
      file ->
        {:ok, file}
    end
  end

  def find_by_date_real2(_parent, %{date: date}, _resolution) do
    path = "/efs_sftp_altan/195/cdrs/bss-cbs_data/#{date}"
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, path)
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end
end
