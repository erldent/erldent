defmodule Edent.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :fname, :string
      add :pname, :string
      add :sname, :string
      add :birthday, :date
      add :phone_pri, :string
      add :phone_sms, :string
      add :phone_extra, :string
      add :source, :string
      add :discount, :decimal

      timestamps()
    end

  end
end
