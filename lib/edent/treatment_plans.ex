defmodule Edent.TreatmentPlans do
  @moduledoc """
  The TreatmentPlans context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.TreatmentPlans.TreatmentPlan

  @doc """
  Returns the list of treatment_plans.

  ## Examples

      iex> list_treatment_plans()
      [%TreatmentPlan{}, ...]

  """
  def list_treatment_plans do
    Repo.all(TreatmentPlan)
  end

  @doc """
  Gets a single treatment_plan.

  Raises `Ecto.NoResultsError` if the Treatment plan does not exist.

  ## Examples

      iex> get_treatment_plan!(123)
      %TreatmentPlan{}

      iex> get_treatment_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_treatment_plan!(id), do: Repo.get!(TreatmentPlan, id)

  @doc """
  Creates a treatment_plan.

  ## Examples

      iex> create_treatment_plan(%{field: value})
      {:ok, %TreatmentPlan{}}

      iex> create_treatment_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_treatment_plan(attrs \\ %{}) do
    %TreatmentPlan{}
    |> TreatmentPlan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a treatment_plan.

  ## Examples

      iex> update_treatment_plan(treatment_plan, %{field: new_value})
      {:ok, %TreatmentPlan{}}

      iex> update_treatment_plan(treatment_plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_treatment_plan(%TreatmentPlan{} = treatment_plan, attrs) do
    treatment_plan
    |> TreatmentPlan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a treatment_plan.

  ## Examples

      iex> delete_treatment_plan(treatment_plan)
      {:ok, %TreatmentPlan{}}

      iex> delete_treatment_plan(treatment_plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_treatment_plan(%TreatmentPlan{} = treatment_plan) do
    Repo.delete(treatment_plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking treatment_plan changes.

  ## Examples

      iex> change_treatment_plan(treatment_plan)
      %Ecto.Changeset{source: %TreatmentPlan{}}

  """
  def change_treatment_plan(%TreatmentPlan{} = treatment_plan) do
    TreatmentPlan.changeset(treatment_plan, %{})
  end
end
