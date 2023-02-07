defmodule ConsumoApiWeb.Schema.Sms do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sms" do
    field :cdr_id, :string
    field :name, :string
  end

  def changeset(sms, attrs) do
    sms
    |> cast(attrs, [:cdr_id])
    |> validate_required([:cdr_id])
  end
end
