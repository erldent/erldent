defmodule Edent.Repo.Migrations.CreateDoctorSchedule do
  use Ecto.Migration

  def change do
    create table(:doctor_schedule) do
      add :d, :date
      add :t1, :time
      add :t2, :time
      add :doctor_id, references(:doctors, on_delete: :nothing)

      timestamps()
    end

    create index(:doctor_schedule, [:doctor_id])
  end
end
