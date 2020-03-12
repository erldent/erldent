defmodule Edent.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :t, :date
      add :tooth, :integer
      add :filename, :string
      add :comments, :string
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:photos, [:patient_id])
  end
end
