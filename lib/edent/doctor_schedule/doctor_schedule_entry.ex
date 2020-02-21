defmodule Edent.DoctorSchedule.DoctorScheduleEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "doctor_schedule" do
    field :d, :date
    field :t1, :time
    field :t2, :time
    field :doctor_id, :id

    timestamps()
  end

  @doc false
  def changeset(doctor_schedule_entry, attrs) do
    doctor_schedule_entry
    |> cast(attrs, [:d, :t1, :t2, :doctor_id])
    |> validate_required([:d, :t1, :t2])
  end
end
