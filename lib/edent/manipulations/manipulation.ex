defmodule Edent.Manipulations.Manipulation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manipulations" do
    field :cost, :decimal
    field :discount_max, :decimal
    field :kind, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(manipulation, attrs) do
    manipulation
    |> cast(attrs, [:title, :cost, :discount_max, :kind])
    |> validate_required([:title, :cost, :discount_max, :kind])
  end
end
