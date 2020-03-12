defmodule Edent.TreatmentPlanItems do
  @moduledoc """
  The TreatmentPlanItems context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.TreatmentPlanItems.TreatmentPlanItem

  @doc """
  Returns the list of treatment_plan_items.

  ## Examples

      iex> list_treatment_plan_items()
      [%TreatmentPlanItem{}, ...]

  """
  def list_treatment_plan_items do
    Repo.all(TreatmentPlanItem)
  end

  @doc """
  Gets a single treatment_plan_item.

  Raises `Ecto.NoResultsError` if the Treatment plan item does not exist.

  ## Examples

      iex> get_treatment_plan_item!(123)
      %TreatmentPlanItem{}

      iex> get_treatment_plan_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_treatment_plan_item!(id), do: Repo.get!(TreatmentPlanItem, id)

  @doc """
  Creates a treatment_plan_item.

  ## Examples

      iex> create_treatment_plan_item(%{field: value})
      {:ok, %TreatmentPlanItem{}}

      iex> create_treatment_plan_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_treatment_plan_item(attrs \\ %{}) do
    %TreatmentPlanItem{}
    |> TreatmentPlanItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a treatment_plan_item.

  ## Examples

      iex> update_treatment_plan_item(treatment_plan_item, %{field: new_value})
      {:ok, %TreatmentPlanItem{}}

      iex> update_treatment_plan_item(treatment_plan_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_treatment_plan_item(%TreatmentPlanItem{} = treatment_plan_item, attrs) do
    treatment_plan_item
    |> TreatmentPlanItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a treatment_plan_item.

  ## Examples

      iex> delete_treatment_plan_item(treatment_plan_item)
      {:ok, %TreatmentPlanItem{}}

      iex> delete_treatment_plan_item(treatment_plan_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_treatment_plan_item(%TreatmentPlanItem{} = treatment_plan_item) do
    Repo.delete(treatment_plan_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking treatment_plan_item changes.

  ## Examples

      iex> change_treatment_plan_item(treatment_plan_item)
      %Ecto.Changeset{source: %TreatmentPlanItem{}}

  """
  def change_treatment_plan_item(%TreatmentPlanItem{} = treatment_plan_item) do
    TreatmentPlanItem.changeset(treatment_plan_item, %{})
  end
end
