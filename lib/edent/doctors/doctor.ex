defmodule Edent.Doctors.Doctor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "doctors" do
    field :fname, :string
    field :lname, :string
    field :pname, :string
    has_many :doctor_schedule, DoctorScheduleEntry

    timestamps()
  end

  @doc false
  def changeset(doctor, attrs) do
    doctor
    |> cast(attrs, [:fname, :pname, :lname])
    |> validate_required([:fname, :pname, :lname])
  end
end
