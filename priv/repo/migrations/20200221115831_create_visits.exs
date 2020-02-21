defmodule Edent.Repo.Migrations.CreateVisits do
  use Ecto.Migration

  def change do
    create table(:visits) do
      add :t, :naive_datetime
      add :duration, :time
      add :cancelled, :boolean, default: false, null: false
      add :complains, :text
      add :recommndations, :text
      add :comments, :text
      add :patient_id, references(:patients, on_delete: :nothing)
      add :doctor_id, references(:doctors, on_delete: :nothing)

      timestamps()
    end

    create index(:visits, [:patient_id])
    create index(:visits, [:doctor_id])
  end
end
