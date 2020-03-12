defmodule Edent.Teethmap do
  @moduledoc """
  The Teethmap context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.Teethmap.TeethMapItems

  @doc """
  Returns the list of teethmap.

  ## Examples

      iex> list_teethmap()
      [%TeethMapItems{}, ...]

  """
  def list_teethmap do
    Repo.all(TeethMapItems)
  end

  @doc """
  Gets a single teeth_map_items.

  Raises `Ecto.NoResultsError` if the Teeth map items does not exist.

  ## Examples

      iex> get_teeth_map_items!(123)
      %TeethMapItems{}

      iex> get_teeth_map_items!(456)
      ** (Ecto.NoResultsError)

  """
  def get_teeth_map_items!(id), do: Repo.get!(TeethMapItems, id)

  @doc """
  Creates a teeth_map_items.

  ## Examples

      iex> create_teeth_map_items(%{field: value})
      {:ok, %TeethMapItems{}}

      iex> create_teeth_map_items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_teeth_map_items(attrs \\ %{}) do
    %TeethMapItems{}
    |> TeethMapItems.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a teeth_map_items.

  ## Examples

      iex> update_teeth_map_items(teeth_map_items, %{field: new_value})
      {:ok, %TeethMapItems{}}

      iex> update_teeth_map_items(teeth_map_items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_teeth_map_items(%TeethMapItems{} = teeth_map_items, attrs) do
    teeth_map_items
    |> TeethMapItems.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a teeth_map_items.

  ## Examples

      iex> delete_teeth_map_items(teeth_map_items)
      {:ok, %TeethMapItems{}}

      iex> delete_teeth_map_items(teeth_map_items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_teeth_map_items(%TeethMapItems{} = teeth_map_items) do
    Repo.delete(teeth_map_items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking teeth_map_items changes.

  ## Examples

      iex> change_teeth_map_items(teeth_map_items)
      %Ecto.Changeset{source: %TeethMapItems{}}

  """
  def change_teeth_map_items(%TeethMapItems{} = teeth_map_items) do
    TeethMapItems.changeset(teeth_map_items, %{})
  end
end
