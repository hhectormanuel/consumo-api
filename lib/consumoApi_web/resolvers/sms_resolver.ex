defmodule ConsumoApiWeb.Resolvers.SmsResolver do
  alias ConsumoApiWeb.Helpers.FilesPath
  alias ConsumoApiWeb.Helpers.SftpConn

  @today "#{FilesPath.get_today_date()}/"
  @path "/efs_sftp_altan/195/cdrs/bss-cbs_sms/"

  def all_sms(_root, _args, _info) do
    IO.inspect FilesPath.get_data("sms", ["|", false], FilesPath.get_today_date())
    {:ok, FilesPath.get_files_prueba(["/home/hector/Desktop/docs/bss-cbs_sms/sms.add"], ["|", false])}
  end

  def all_sms_real(_root, _args, _info) do
    {:ok, FilesPath.get_data("sms", ["|", false], FilesPath.get_today_date())}
  end

  def all_sms_real2(_root, _args, _info) do
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, @path <> @today)
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end

  def find_by_date(_parent, %{cdr_batch_id: cdr_batch_id}, _resolution) do
    condition =
      FilesPath.get_files_prueba(["/home/hector/Desktop/docs/bss-cbs_sms/sms.add"], ["|", false])
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
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, @path <> "#{date}/")
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end


end
