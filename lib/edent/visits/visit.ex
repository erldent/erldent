defmodule Edent.Visits.Visit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visits" do
    field :cancelled, :boolean, default: false
    field :comments, :string
    field :complains, :string
    field :duration, :time
    field :recommndations, :string
    field :t, :naive_datetime
#    field :patient_id, :id
    belongs_to(:patient, Edent.Patients.Patient)
#    field :doctor_id, :id
    belongs_to(:doctor, Edent.Doctors.Doctor)

    timestamps()
  end

  @doc false
  def changeset(visit, attrs) do
    visit
    |> cast(attrs, [:t, :duration, :cancelled, :complains,
        :recommndations, :comments, :patient_id,
        :doctor_id])
    |> validate_required([:t, :duration, :cancelled,
        :patient_id])
  end
end
