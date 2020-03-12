defmodule Edent.Manipulations do
  @moduledoc """
  The Manipulations context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.Manipulations.Manipulation

  @doc """
  Returns the list of manipulations.

  ## Examples

      iex> list_manipulations()
      [%Manipulation{}, ...]

  """
  def list_manipulations do
    Repo.all(Manipulation)
  end

  @doc """
  Gets a single manipulation.

  Raises `Ecto.NoResultsError` if the Manipulation does not exist.

  ## Examples

      iex> get_manipulation!(123)
      %Manipulation{}

      iex> get_manipulation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manipulation!(id), do: Repo.get!(Manipulation, id)

  @doc """
  Creates a manipulation.

  ## Examples

      iex> create_manipulation(%{field: value})
      {:ok, %Manipulation{}}

      iex> create_manipulation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manipulation(attrs \\ %{}) do
    %Manipulation{}
    |> Manipulation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manipulation.

  ## Examples

      iex> update_manipulation(manipulation, %{field: new_value})
      {:ok, %Manipulation{}}

      iex> update_manipulation(manipulation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manipulation(%Manipulation{} = manipulation, attrs) do
    manipulation
    |> Manipulation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a manipulation.

  ## Examples

      iex> delete_manipulation(manipulation)
      {:ok, %Manipulation{}}

      iex> delete_manipulation(manipulation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manipulation(%Manipulation{} = manipulation) do
    Repo.delete(manipulation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manipulation changes.

  ## Examples

      iex> change_manipulation(manipulation)
      %Ecto.Changeset{source: %Manipulation{}}

  """
  def change_manipulation(%Manipulation{} = manipulation) do
    Manipulation.changeset(manipulation, %{})
  end
end
