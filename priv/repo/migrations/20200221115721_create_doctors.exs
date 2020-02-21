defmodule Edent.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :fname, :string
      add :pname, :string
      add :lname, :string

      timestamps()
    end

  end
end
