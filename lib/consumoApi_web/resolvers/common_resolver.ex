defmodule ConsumoApiWeb.Resolvers.CommonResolver do
  alias ConsumoApiWeb.Helpers.FilesPath

  @today FilesPath.get_today_date()

  def all_files(_root, _args, _info) do
    case FilesPath.get_files_prueba([
      "/home/hector/Desktop/docs/bss-cbs_voice/voice.add",
      "/home/hector/Desktop/docs/bss-cbs_voice/voice2.add",
      "/home/hector/Desktop/docs/bss-cbs_data/1.add",
      "/home/hector/Desktop/docs/bss-cbs_sms/sms.add"], ["|", false]) do
      [] -> {:error, "No files with this conditions"}
      files -> {:ok, files}
    end
  end

  def all_files_real(_root, _args, _info) do
    case FilesPath.get_data("all", ["|", false], @today) do
      [] -> {:error, "No files with this conditions kind: voice, sms and data date: #{@today}"}
      files -> {:ok, files}
    end
  end

  def find_by_date(_parent, %{cdr_batch_id: cdr_batch_id}, _resolution) do
    condition =
      FilesPath.get_data("all", ["|", false], @today)
      |> Enum.find(nil, fn map ->
      map.cdr_batch_id == cdr_batch_id end)
    case condition do
      nil ->
        {:error, "File Voice with date #{cdr_batch_id} not found"}
      file ->
        {:ok, file}
    end
  end

  def find_by_date_real(_parent, %{cdr_batch_id: cdr_batch_id}, _resolution) do
    condition =
      FilesPath.get_data("all", ["|", false], cdr_batch_id)
    case condition do
      [] ->
        {:error, "Files by date #{cdr_batch_id} not found"}
      files ->
        {:ok, files}
    end
  end
end
