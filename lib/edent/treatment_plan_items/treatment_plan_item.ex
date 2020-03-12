defmodule Edent.TreatmentPlanItems.TreatmentPlanItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treatment_plan_items" do
    field :comments, :string
    field :tooth, :integer
    field :treatment_plan_id, :id
    field :manipulation_id, :id

    timestamps()
  end

  @doc false
  def changeset(treatment_plan_item, attrs) do
    treatment_plan_item
    |> cast(attrs, [:tooth, :comments])
    |> validate_required([:tooth, :comments])
  end
end
