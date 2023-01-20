defmodule ConsumoApiWeb.ItemController do
  alias ConsumoApiWeb.Helpers.CsvConverter
  use ConsumoApiWeb, :controller
  import Ecto.Query, warn: false
  alias ConsumoApi.Schema.Parameters

  # def file(conn, _params) do
  #   response = CsvConverter.read_csv_from_file("/home/hector/Downloads/weekday.csv")
  #   render(conn, "index.json", items: response)
  # end

  # def show(conn, %{"id" => id}) do
  #   [item|_] = Enum.filter([1,23], fn x -> x.id == String.to_integer(id) end)
  #   render(conn, "show.json", item: item)
  # end

  def url_post(conn, params) do
    {has_columns, sep, space, url_or_path} = get_changeset(params)
    response = CsvConverter.read_csv_from_url(url_or_path, sep, space, has_columns)
    render(conn, "index.json", items: response)
  end

  def file_post(conn, params) do
    {has_columns, sep, space, url_or_path} = get_changeset(params)
    response = CsvConverter.read_csv_from_file(url_or_path, sep, space, has_columns)
    render(conn, "index.json", items: response)
  end

  def get_changeset(params) do
    %{changes: %{has_columns: has_columns, sep: sep, space: space, url_or_path: url_or_path}} =
      %Parameters{}
      |> Parameters.changeset(params)
    {has_columns, sep, space, url_or_path}
  end

end
