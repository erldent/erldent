defmodule Edent.VisitExtraDoctors.VisitExtraDoctor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visit_extra_doctors" do
    field :comments, :string
    field :doctor_id, :id
    field :visit_id, :id

    timestamps()
  end

  @doc false
  def changeset(visit_extra_doctor, attrs) do
    visit_extra_doctor
    |> cast(attrs, [:comments])
    |> validate_required([:comments])
  end
end
