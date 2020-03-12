defmodule Edent.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :comments, :string
    field :filename, :string
    field :t, :date
    field :tooth, :integer
    field :patient_id, :id

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:t, :tooth, :filename, :comments])
    |> validate_required([:t, :tooth, :filename, :comments])
  end
end
