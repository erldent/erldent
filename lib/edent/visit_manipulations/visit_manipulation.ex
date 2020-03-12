defmodule Edent.VisitManipulations.VisitManipulation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visit_manipulations" do
    field :doctor_id, :id
    field :visit_id, :id
    field :manipulation_id, :id
    field :treatment_plan_item_id, :id

    timestamps()
  end

  @doc false
  def changeset(visit_manipulation, attrs) do
    visit_manipulation
    |> cast(attrs, [])
    |> validate_required([])
  end
end
