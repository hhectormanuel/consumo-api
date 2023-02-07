defmodule ConsumoApiWeb.Resolvers.SmsResolver do
  alias ConsumoApiWeb.Helpers.FilesPath

  def all_sms(_root, _args, _info) do
    IO.inspect FilesPath.get_data("sms", ["|", false], FilesPath.get_today_date())
    {:ok, FilesPath.get_files_prueba(["/home/hector/Desktop/docs/bss-cbs_sms/sms.add"], ["|", false])}
  end

  def all_sms_real(_root, _args, _info) do
    {:ok, FilesPath.get_data("sms", ["|", false], FilesPath.get_today_date())}
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

end