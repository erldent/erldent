defmodule Edent.TreatmentPlans.TreatmentPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treatment_plans" do
    field :created, :naive_datetime
    field :finish_schedule, :naive_datetime
    field :isfinished, :boolean, default: false
#    field :patient_id, :id
    belongs_to(:patient, Edent.Patients.Patient)

    timestamps()
  end

  @doc false
  def changeset(treatment_plan, attrs) do
    treatment_plan
    |> cast(attrs, [:created, :finish_schedule, :isfinished, :patient_id])
    |> validate_required([:created, :finish_schedule, :isfinished, :patient_id])
  end
end
