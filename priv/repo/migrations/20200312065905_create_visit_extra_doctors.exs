defmodule Edent.Repo.Migrations.CreateVisitExtraDoctors do
  use Ecto.Migration

  def change do
    create table(:visit_extra_doctors) do
      add :comments, :string
      add :doctor_id, references(:doctors, on_delete: :nothing)
      add :visit_id, references(:visits, on_delete: :nothing)

      timestamps()
    end

    create index(:visit_extra_doctors, [:doctor_id])
    create index(:visit_extra_doctors, [:visit_id])
  end
end
