defmodule Edent.Repo.Migrations.CreateVisitManipulations do
  use Ecto.Migration

  def change do
    create table(:visit_manipulations) do
      add :doctor_id, references(:doctors, on_delete: :nothing)
      add :visit_id, references(:visits, on_delete: :nothing)
      add :manipulation_id, references(:manipulations, on_delete: :nothing)
      add :treatment_plan_item_id, references(:treatment_plans, on_delete: :nothing)

      timestamps()
    end

    create index(:visit_manipulations, [:doctor_id])
    create index(:visit_manipulations, [:visit_id])
    create index(:visit_manipulations, [:manipulation_id])
    create index(:visit_manipulations, [:treatment_plan_item_id])
  end
end
