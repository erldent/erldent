defmodule Edent.Teethmap.TeethMapItems do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teethmap" do
    field :comments, :string
    field :t, :date
    field :tooth, :integer
    field :patient_id, :id
    field :treatment_plan_id, :id

    timestamps()
  end

  @doc false
  def changeset(teeth_map_items, attrs) do
    teeth_map_items
    |> cast(attrs, [:t, :tooth, :comments])
    |> validate_required([:t, :tooth, :comments])
  end
end
