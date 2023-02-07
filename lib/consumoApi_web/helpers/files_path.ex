defmodule ConsumoApiWeb.Helpers.FilesPath do
  # @test_path "/static/config_be_id/cdrs/service_dir/YYYYMMDD/*.add"
  alias ConsumoApiWeb.Helpers.CsvConverter

  def get_today_date() do
    Date.utc_today()
    |> Date.to_iso8601(:basic)
  end

  defp default_path(date \\ get_today_date(), type \\ true) do
    sms = "/static/config_be_id/cdrs/bss-cbs_sms/#{date}"
    voice = "/static/config_be_id/cdrs/bss-cbs_voice/#{date}"
    data = "/static/config_be_id/cdrs/bss-cbs_data/#{date}"
    case type do
      "sms" -> [sms]
      "voice" -> [voice]
      "data" -> [data]
      _ -> [sms, voice, data]
    end
  end

  def find_in_folders(list_path) do
    Enum.map(list_path, fn x ->
      case System.shell("ls #{x}") do
        {"", _} -> []
        {data, _} ->
          data
          |> String.split("\n")
          |> List.delete("")
          |> Enum.map(fn y -> "#{x}/#{y}"  end)
      end
    end)
    |> List.flatten()
  end

  defp search_in_files(list_path, _fecha) do
    {:ok, agent} = Agent.start_link fn -> [] end
    fecha = "20220823"
    Enum.each(list_path, fn x ->
      case System.shell("grep -w '#{fecha}' #{x}") do
        {_, 0} -> Agent.update(agent, fn list -> [x | list] end)
        _ -> :ok
      end
    end)
    Agent.get(agent, fn list -> list end)
  end



  # def get_data(date \\ get_today_date(), type \\ ["sms", "voice", "data"], [sep, space, has_columns]) do
  #   date
  #   |> default_path(type)
  #   |> find_folders()
  #   # |> search_in_files("!123")
  # end

  # def get_data2(date \\ get_today_date(), type \\ ["sms", "voice", "data"], [sep, space, has_columns]) do
  #   date
  #   |> default_path(type)
  #   # |> find_folders()
  #   |> all_files_data(sep, space, has_columns, type)
  # end

  def get_data244(type \\ ["sms", "voice", "data"], [sep, has_columns], date \\ get_today_date()) do
    date
    |> default_path(type)
    |> all_files_data(sep, has_columns)
  end

  def get_data(type, [sep, has_columns], date) do
    date
    |> default_path(type)
    |> find_in_folders()
    |> all_files_data(sep, has_columns)
  end

  def get_data_test(date, type, [sep, has_columns]) do
    date
    |> default_path(type)
    ["/home/hector/Desktop/docs/bss-cbs_voice", "/home/hector/Desktop/docs/bss-cbs_voice"]
    |> find_in_folders()
    |> all_files_data(sep, has_columns)
  end

  def get_data_test2(date, type, [sep, has_columns]) do
    date
    |> default_path(type)
    ["/home/hector/Desktop/docs/bss-cbs_voice"]
    |> find_in_folders()
    # |> all_files_data(sep, has_columns)
  end

  def get_files_prueba(paths, [sep, has_columns]) do
    # |> find_folders()
    paths
    |> all_files_data_test(sep, has_columns)
  end

  defp all_files_data_test(paths, sep, has_columns) do
    Agent.start_link(fn  -> [] end)
    Enum.reduce(paths, [], fn path, acc ->
      CsvConverter.read_csv_from_file(path, sep, has_columns, get_type_from_path(path)) ++ acc
    end)
    |> List.flatten()
  end

  defp get_type_from_path(path) do
    path = String.split(path, "/")
    cond do
      "bss-cbs_sms" in path -> ["sms"]
      "bss-cbs_voice" in path -> ["voice"]
      "bss-cbs_data" in path -> ["data"]
    end
  end

  def all_files_data([], _sep, _has_columns), do: []

  def all_files_data(paths, sep, has_columns) do
    Agent.start_link(fn  -> [] end)
    Enum.reduce(paths, [], fn path, acc ->
      CsvConverter.read_csv_from_file(path, sep, has_columns, get_type_from_path(path)) ++ acc
    end)
    |> List.flatten()
  end
end
