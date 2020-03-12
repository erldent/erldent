defmodule Edent.VisitExtraDoctors do
  @moduledoc """
  The VisitExtraDoctors context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.VisitExtraDoctors.VisitExtraDoctor

  @doc """
  Returns the list of visit_extra_doctors.

  ## Examples

      iex> list_visit_extra_doctors()
      [%VisitExtraDoctor{}, ...]

  """
  def list_visit_extra_doctors do
    Repo.all(VisitExtraDoctor)
  end

  @doc """
  Gets a single visit_extra_doctor.

  Raises `Ecto.NoResultsError` if the Visit extra doctor does not exist.

  ## Examples

      iex> get_visit_extra_doctor!(123)
      %VisitExtraDoctor{}

      iex> get_visit_extra_doctor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visit_extra_doctor!(id), do: Repo.get!(VisitExtraDoctor, id)

  @doc """
  Creates a visit_extra_doctor.

  ## Examples

      iex> create_visit_extra_doctor(%{field: value})
      {:ok, %VisitExtraDoctor{}}

      iex> create_visit_extra_doctor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visit_extra_doctor(attrs \\ %{}) do
    %VisitExtraDoctor{}
    |> VisitExtraDoctor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visit_extra_doctor.

  ## Examples

      iex> update_visit_extra_doctor(visit_extra_doctor, %{field: new_value})
      {:ok, %VisitExtraDoctor{}}

      iex> update_visit_extra_doctor(visit_extra_doctor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visit_extra_doctor(%VisitExtraDoctor{} = visit_extra_doctor, attrs) do
    visit_extra_doctor
    |> VisitExtraDoctor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a visit_extra_doctor.

  ## Examples

      iex> delete_visit_extra_doctor(visit_extra_doctor)
      {:ok, %VisitExtraDoctor{}}

      iex> delete_visit_extra_doctor(visit_extra_doctor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visit_extra_doctor(%VisitExtraDoctor{} = visit_extra_doctor) do
    Repo.delete(visit_extra_doctor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visit_extra_doctor changes.

  ## Examples

      iex> change_visit_extra_doctor(visit_extra_doctor)
      %Ecto.Changeset{source: %VisitExtraDoctor{}}

  """
  def change_visit_extra_doctor(%VisitExtraDoctor{} = visit_extra_doctor) do
    VisitExtraDoctor.changeset(visit_extra_doctor, %{})
  end
end
