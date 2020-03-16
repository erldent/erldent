defmodule Edent.VisitManipulations.VisitManipulation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visit_manipulations" do
#    field :doctor_id, :id
    belongs_to(:doctor, Edent.Doctors.Doctor)
#    field :visit_id, :id
    belongs_to(:visit, Edent.Visits.Visit)
#    field :manipulation_id, :id
    belongs_to(:manipulation, Edent.Manipulations.Manipulation)
#    field :treatment_plan_item_id, :id
    belongs_to(:treatment_plan_item, Edent.TreatmentPlanItems.TreatmentPlanItem)

    timestamps()
  end

  @doc false
  def changeset(visit_manipulation, attrs) do
    visit_manipulation
    |> cast(attrs, [:doctor_id, :visit_id, :manipulation_id, :treatment_plan_tem_id])
    |> validate_required([:doctor_id, :visit_id, :manipulation_id])
  end
end
