defmodule Edent.Teethmap.TeethMapItems do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teethmap" do
    field :comments, :string
    field :t, :date
    field :tooth, :integer
#    field :patient_id, :id
    belongs_to(:patient, Edent.Patients.Patient)
#    field :treatment_plan_id, :id
    belongs_to(:treatment_plan, Edent.TreatmentPlans.TreatmentPlan)

    timestamps()
  end

  @doc false
  def changeset(teeth_map_items, attrs) do
    teeth_map_items
    |> cast(attrs, [:t, :tooth, :comments, :patient_id, :treatment_plan_id])
    |> validate_required([:t, :tooth, :comments, :patient_id])
  end
end
