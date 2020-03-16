defmodule Edent.Reminders.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reminders" do
    field :auto, :boolean, default: false
    field :comments, :string, default: nil
    field :t, :naive_datetime
    field :text, :string
#    field :patient_id, :id
    belongs_to(:patient, Edent.Patients.Patient)

    timestamps()
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:t, :text, :auto, :comments, :patient_id])
    |> validate_required([:t, :text, :auto, :patient_id])
  end
end
