defmodule Edent.Repo.Migrations.CreateManipulations do
  use Ecto.Migration

  def change do
    create table(:manipulations) do
      add :title, :string
      add :cost, :decimal
      add :discount_max, :decimal
      add :kind, :string

      timestamps()
    end

  end
end
