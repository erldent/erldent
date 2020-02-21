defmodule Edent.DoctorSchedule do
  @moduledoc """
  The DoctorSchedule context.
  """

  import Ecto.Query, warn: false
  alias Edent.Repo

  alias Edent.DoctorSchedule.DoctorScheduleEntry

  @doc """
  Returns the list of doctor_schedule.

  ## Examples

      iex> list_doctor_schedule()
      [%DoctorScheduleEntry{}, ...]

  """
  def list_doctor_schedule do
    Repo.all(DoctorScheduleEntry)
  end

  @doc """
  Gets a single doctor_schedule_entry.

  Raises `Ecto.NoResultsError` if the Doctor schedule entry does not exist.

  ## Examples

      iex> get_doctor_schedule_entry!(123)
      %DoctorScheduleEntry{}

      iex> get_doctor_schedule_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_doctor_schedule_entry!(id), do: Repo.get!(DoctorScheduleEntry, id)

  @doc """
  Creates a doctor_schedule_entry.

  ## Examples

      iex> create_doctor_schedule_entry(%{field: value})
      {:ok, %DoctorScheduleEntry{}}

      iex> create_doctor_schedule_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_doctor_schedule_entry(attrs \\ %{}) do
    %DoctorScheduleEntry{}
    |> DoctorScheduleEntry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a doctor_schedule_entry.

  ## Examples

      iex> update_doctor_schedule_entry(doctor_schedule_entry, %{field: new_value})
      {:ok, %DoctorScheduleEntry{}}

      iex> update_doctor_schedule_entry(doctor_schedule_entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_doctor_schedule_entry(%DoctorScheduleEntry{} = doctor_schedule_entry, attrs) do
    doctor_schedule_entry
    |> DoctorScheduleEntry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a doctor_schedule_entry.

  ## Examples

      iex> delete_doctor_schedule_entry(doctor_schedule_entry)
      {:ok, %DoctorScheduleEntry{}}

      iex> delete_doctor_schedule_entry(doctor_schedule_entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_doctor_schedule_entry(%DoctorScheduleEntry{} = doctor_schedule_entry) do
    Repo.delete(doctor_schedule_entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking doctor_schedule_entry changes.

  ## Examples

      iex> change_doctor_schedule_entry(doctor_schedule_entry)
      %Ecto.Changeset{source: %DoctorScheduleEntry{}}

  """
  def change_doctor_schedule_entry(%DoctorScheduleEntry{} = doctor_schedule_entry) do
    DoctorScheduleEntry.changeset(doctor_schedule_entry, %{})
  end
end
