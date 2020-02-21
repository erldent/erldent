defmodule EdentWeb.DoctorScheduleEntryController do
  use EdentWeb, :controller

  alias Edent.DoctorSchedule
  alias Edent.DoctorSchedule.DoctorScheduleEntry

  def index(conn, _params) do
    doctor_schedule = DoctorSchedule.list_doctor_schedule()
    render(conn, "index.html", doctor_schedule: doctor_schedule)
  end

  def new(conn, _params) do
    changeset = DoctorSchedule.change_doctor_schedule_entry(%DoctorScheduleEntry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor_schedule_entry" => doctor_schedule_entry_params}) do
    case DoctorSchedule.create_doctor_schedule_entry(doctor_schedule_entry_params) do
      {:ok, doctor_schedule_entry} ->
        conn
        |> put_flash(:info, "Doctor schedule entry created successfully.")
        |> redirect(to: Routes.doctor_schedule_entry_path(conn, :show, doctor_schedule_entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor_schedule_entry = DoctorSchedule.get_doctor_schedule_entry!(id)
    render(conn, "show.html", doctor_schedule_entry: doctor_schedule_entry)
  end

  def edit(conn, %{"id" => id}) do
    doctor_schedule_entry = DoctorSchedule.get_doctor_schedule_entry!(id)
    changeset = DoctorSchedule.change_doctor_schedule_entry(doctor_schedule_entry)
    render(conn, "edit.html", doctor_schedule_entry: doctor_schedule_entry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor_schedule_entry" => doctor_schedule_entry_params}) do
    doctor_schedule_entry = DoctorSchedule.get_doctor_schedule_entry!(id)

    case DoctorSchedule.update_doctor_schedule_entry(doctor_schedule_entry, doctor_schedule_entry_params) do
      {:ok, doctor_schedule_entry} ->
        conn
        |> put_flash(:info, "Doctor schedule entry updated successfully.")
        |> redirect(to: Routes.doctor_schedule_entry_path(conn, :show, doctor_schedule_entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", doctor_schedule_entry: doctor_schedule_entry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor_schedule_entry = DoctorSchedule.get_doctor_schedule_entry!(id)
    {:ok, _doctor_schedule_entry} = DoctorSchedule.delete_doctor_schedule_entry(doctor_schedule_entry)

    conn
    |> put_flash(:info, "Doctor schedule entry deleted successfully.")
    |> redirect(to: Routes.doctor_schedule_entry_path(conn, :index))
  end
end
