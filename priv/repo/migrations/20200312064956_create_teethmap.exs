defmodule Edent.Repo.Migrations.CreateTeethmap do
  use Ecto.Migration

  def change do
    create table(:teethmap) do
      add :t, :date
      add :tooth, :integer
      add :comments, :string
      add :patient_id, references(:patients, on_delete: :nothing)
      add :treatment_plan_id, references(:treatment_plans, on_delete: :nothing)

      timestamps()
    end

    create index(:teethmap, [:patient_id])
    create index(:teethmap, [:treatment_plan_id])
  end
end
