defmodule Edent.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :birthday, :date
    field :discount, :decimal
    field :fname, :string
    field :phone_extra, :string
    field :phone_pri, :string
    field :phone_sms, :string
    field :pname, :string
    field :sname, :string
    field :source, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:fname, :pname, :sname, :birthday, :phone_pri, :phone_sms, :phone_extra, :source, :discount])
    |> validate_required([:fname, :pname, :sname, :birthday, :phone_pri, :phone_sms, :phone_extra, :source, :discount])
  end
end
