defmodule Edent.VisitManipulations do
  @moduledoc """
  The VisitManipulations context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.VisitManipulations.VisitManipulation

  @doc """
  Returns the list of visit_manipulations.

  ## Examples

      iex> list_visit_manipulations()
      [%VisitManipulation{}, ...]

  """
  def list_visit_manipulations do
    Repo.all(VisitManipulation)
  end

  @doc """
  Gets a single visit_manipulation.

  Raises `Ecto.NoResultsError` if the Visit manipulation does not exist.

  ## Examples

      iex> get_visit_manipulation!(123)
      %VisitManipulation{}

      iex> get_visit_manipulation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visit_manipulation!(id), do: Repo.get!(VisitManipulation, id)

  @doc """
  Creates a visit_manipulation.

  ## Examples

      iex> create_visit_manipulation(%{field: value})
      {:ok, %VisitManipulation{}}

      iex> create_visit_manipulation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visit_manipulation(attrs \\ %{}) do
    %VisitManipulation{}
    |> VisitManipulation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visit_manipulation.

  ## Examples

      iex> update_visit_manipulation(visit_manipulation, %{field: new_value})
      {:ok, %VisitManipulation{}}

      iex> update_visit_manipulation(visit_manipulation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visit_manipulation(%VisitManipulation{} = visit_manipulation, attrs) do
    visit_manipulation
    |> VisitManipulation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a visit_manipulation.

  ## Examples

      iex> delete_visit_manipulation(visit_manipulation)
      {:ok, %VisitManipulation{}}

      iex> delete_visit_manipulation(visit_manipulation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visit_manipulation(%VisitManipulation{} = visit_manipulation) do
    Repo.delete(visit_manipulation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visit_manipulation changes.

  ## Examples

      iex> change_visit_manipulation(visit_manipulation)
      %Ecto.Changeset{source: %VisitManipulation{}}

  """
  def change_visit_manipulation(%VisitManipulation{} = visit_manipulation) do
    VisitManipulation.changeset(visit_manipulation, %{})
  end
end
