defmodule Edent.TreatmentPlanItems.TreatmentPlanItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treatment_plan_items" do
    field :comments, :string
    field :tooth, :integer
#    field :treatment_plan_id, :id
    belongs_to(:treatment_plan, Edent.TreatmentPlans.TreatmentPlan)
#    field :manipulation_id, :id
    belongs_to(:manipulation, Edent.Manipulations.Manipulation)

    timestamps()
  end

  @doc false
  def changeset(treatment_plan_item, attrs) do
    treatment_plan_item
    |> cast(attrs, [:tooth, :comments, :treatment_plan_id, :manipulation_id])
    |> validate_required([:tooth, :comments, :treatment_plan_id, :manipulation_id])
  end
end
