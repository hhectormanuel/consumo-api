defmodule ConsumoApiWeb.Resolvers.VoiceResolver do
  alias ConsumoApiWeb.Helpers.FilesPath
  alias ConsumoApiWeb.Helpers.SftpConn

  @today "#{FilesPath.get_today_date()}/"
  @path "/efs_sftp_altan/195/cdrs/bss-cbs_voice/"

  # def all_voice(_root, _args, _info) do
  #   {:ok, FilesPath.get_files_prueba([
  #     "/home/hector/Desktop/docs/bss-cbs_voice/voice.add",
  #     "/home/hector/Desktop/docs/bss-cbs_voice/voice2.add"], ["|", false])}
  # end

  def all_voice(_root, _args, _info) do
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, @path <> @today)
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end

  # def all_voice_real(_root, _args, _info) do
  #   {:ok, FilesPath.get_data("voice", ["|", false], FilesPath.get_today_date())}
  # end

  def find_cdr_id(_parent, %{cdr_id: cdr_id}, _resolution) do
    condition =
      FilesPath.get_files_prueba([
        "/home/hector/Desktop/docs/bss-cbs_voice/voice.add",
        "/home/hector/Desktop/docs/bss-cbs_voice/voice2.add"], ["|", false])
      |> Enum.find(nil, fn map ->
      map.cdr_id == cdr_id end)
    case condition do
      nil ->
        {:error, "File Voice #{cdr_id} not found"}
      voice_file ->
        {:ok, voice_file}
    end
  end

  # def find_by_date(_parent, %{date: date}, _resolution) do
  #   IO.inspect FilesPath.get_data("voice", ["|", false], date)
  #   condition =
  #     FilesPath.get_files_prueba([
  #       "/home/hector/Desktop/docs/bss-cbs_voice/voice.add",
  #       "/home/hector/Desktop/docs/bss-cbs_voice/voice2.add"], ["|", false])
  #     |> Enum.find(nil, fn map ->
  #     map.cdr_batch_id == date end)
  #   case condition do
  #     nil ->
  #       {:error, "File Voice with date #{date} not found"}
  #     file ->
  #       {:ok, file}
  #   end
  # end

  # def find_by_date_real(_parent, %{date: date}, _resolution) do
  #   condition =
  #     FilesPath.get_data("voice", ["|", false],date)
  #   case condition do
  #     [] ->
  #       {:error, "Files by date #{date} not found"}
  #     files ->
  #       {:ok, files}
  #   end
  # end

  def find_by_date(_parent, %{date: date}, _resolution) do
    conn = SftpConn.connection()
    paths = SftpConn.get_files(conn, @path <> "#{date}/")
    case SftpConn.read_files(conn, paths) do
      {:error, error} -> {:error, error}
      files -> {:ok, files}
    end
  end

end
