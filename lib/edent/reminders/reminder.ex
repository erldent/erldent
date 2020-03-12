defmodule Edent.Reminders.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reminders" do
    field :auto, :boolean, default: false
    field :comments, :string
    field :t, :naive_datetime
    field :text, :string
    field :patient_id, :id

    timestamps()
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:t, :text, :auto, :comments])
    |> validate_required([:t, :text, :auto, :comments])
  end
end
