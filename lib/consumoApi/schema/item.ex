defmodule ConsumoApi.Schema.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :url_or_path, :string
    field :sep, :string
    field :space, :binary
    field :has_columns, :boolean
  end

  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:url_or_path])
    |> validate_required([:url_or_path])
  end

end
