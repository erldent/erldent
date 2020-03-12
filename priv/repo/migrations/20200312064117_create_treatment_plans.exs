defmodule Edent.Repo.Migrations.CreateTreatmentPlans do
  use Ecto.Migration

  def change do
    create table(:treatment_plans) do
      add :created, :naive_datetime
      add :finish_schedule, :naive_datetime
      add :isfinished, :boolean, default: false, null: false
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:treatment_plans, [:patient_id])
  end
end
