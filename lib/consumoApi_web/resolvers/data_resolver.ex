defmodule ConsumoApiWeb.Resolvers.DataResolver do
  alias ConsumoApiWeb.Helpers.FilesPath

  def all_data(_root, _args, _info) do
    {:ok, FilesPath.get_files_prueba(["/home/hector/Desktop/docs/bss-cbs_data/1.add"], ["|", false])}
  end

  def all_data_real(_root, _args, _info) do
    {:ok, FilesPath.get_data("data", ["|", false], FilesPath.get_today_date())}
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


end
