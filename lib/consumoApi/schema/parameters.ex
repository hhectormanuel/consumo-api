defmodule ConsumoApi.Schema.Parameters do
  use Ecto.Schema
  import Ecto.Changeset
  alias ConsumoApiWeb.Helpers.FilesPath

  embedded_schema do
    field :date, :string
    field :type, :string
    field :sep, :string
    field :has_columns, :boolean
  end

  def changeset(option, attrs \\ %{}) do
    option
    |> cast(attrs, [:date, :type, :sep, :has_columns])
    |> validate_date()
    |> validate_type()
    |> validate_sep()
    |> validate_has_columns()
    |> validate_required([:date, :type, :sep, :has_columns])
    |> valid()

  end

  def valid(changeset) when changeset.valid? == true, do: changeset

  def valid(changeset) when changeset.valid? != true, do: raise("The parameters arent invalid")

  def validate_date(changeset) do
    unless Map.has_key?(changeset.changes, :date) do
      date = FilesPath.get_today_date()
      put_change(changeset, :date, date)
    else
      changeset
    end
  end

  def validate_sep(changeset) do
    unless Map.has_key?(changeset.changes, :sep) do
      put_change(changeset, :sep, "|")
    else
      changeset
    end
  end

  def validate_type(changeset) do
    unless Map.has_key?(changeset.changes, :type) do
      put_change(changeset, :type, ["sms", "voice", "data"])
    else
      changeset
    end
  end

  def validate_has_columns(changeset) do
    unless Map.has_key?(changeset.changes, :has_columns) do
      put_change(changeset, :has_columns, false)
    else
      changeset
    end
  end
end
