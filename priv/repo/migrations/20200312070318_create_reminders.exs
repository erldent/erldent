defmodule Edent.Repo.Migrations.CreateReminders do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :t, :naive_datetime
      add :text, :string
      add :auto, :boolean, default: false, null: false
      add :comments, :string
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:reminders, [:patient_id])
  end
end
