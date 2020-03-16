defmodule Edent.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :comments, :string
    field :filename, :string
    field :t, :date
    field :tooth, :integer
#    field :patient_id, :id
    belongs_to(:patient, Edent.Patients.Patient)

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:t, :tooth, :filename, :comments, :patient_id])
    |> validate_required([:t, :tooth, :filename, :comments, :patient_id])
  end
end
