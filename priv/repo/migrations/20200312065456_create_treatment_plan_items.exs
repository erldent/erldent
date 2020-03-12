defmodule Edent.Repo.Migrations.CreateTreatmentPlanItems do
  use Ecto.Migration

  def change do
    create table(:treatment_plan_items) do
      add :tooth, :integer
      add :comments, :string
      add :treatment_plan_id, references(:treatment_plans, on_delete: :nothing)
      add :manipulation_id, references(:manipulations, on_delete: :nothing)

      timestamps()
    end

    create index(:treatment_plan_items, [:treatment_plan_id])
    create index(:treatment_plan_items, [:manipulation_id])
  end
end
