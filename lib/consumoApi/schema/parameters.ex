defmodule ConsumoApi.Schema.Parameters do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :url_or_path, :string
    field :sep, :string
    field :space, :binary
    field :has_columns, :boolean
  end

  def changeset(option, attrs \\ %{}) do
    option
    |> cast(attrs, [:url_or_path, :sep, :space, :has_columns])
    |> validate_sep()
    |> validate_space()
    |> validate_has_columns()
    |> validate_required([:url_or_path, :sep, :has_columns])
    |> valid()

  end

  def valid(changeset) when changeset.valid? == true, do: changeset

  def valid(changeset) when changeset.valid? != true, do: raise("The parameters that you put arent valid")

  def validate_sep(changeset) do
    unless Map.has_key?(changeset.changes, :sep) do
      put_change(changeset, :sep, ",")
    else
      changeset
    end
  end

  def validate_space(changeset) do
    unless Map.has_key?(changeset.changes, :space) do
      put_change(changeset, :space, "\n")
    else
      changeset
    end
  end

  def validate_has_columns(changeset) do
    unless Map.has_key?(changeset.changes, :has_columns) do
      put_change(changeset, :has_columns, true)
    else
      changeset
    end
  end
end
