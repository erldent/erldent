defmodule Edent.VisitExtraDoctors.VisitExtraDoctor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visit_extra_doctors" do
    field :comments, :string
#    field :doctor_id, :id
    belongs_to(:doctor, Edent.Doctors.Doctor)
#    field :visit_id, :id
    belongs_to(:visit, Edent.Visits.Visit)

    timestamps()
  end

  @doc false
  def changeset(visit_extra_doctor, attrs) do
    visit_extra_doctor
    |> cast(attrs, [:comments, :doctor_id, :visit_id])
    |> validate_required([:comments, :doctor_id, :visit_id])
  end
end
