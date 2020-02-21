defmodule EdentWeb.DoctorController do
  use EdentWeb, :controller

  alias Edent.Doctors
  alias Edent.Doctors.Doctor

  def index(conn, _params) do
    doctors = Doctors.list_doctors()
    render(conn, "index.html", doctors: doctors)
  end

  def new(conn, _params) do
    changeset = Doctors.change_doctor(%Doctor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case Doctors.create_doctor(doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor created successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    render(conn, "show.html", doctor: doctor)
  end

  def edit(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    changeset = Doctors.change_doctor(doctor)
    render(conn, "edit.html", doctor: doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Doctors.get_doctor!(id)

    case Doctors.update_doctor(doctor, doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor updated successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", doctor: doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    {:ok, _doctor} = Doctors.delete_doctor(doctor)

    conn
    |> put_flash(:info, "Doctor deleted successfully.")
    |> redirect(to: Routes.doctor_path(conn, :index))
  end
end
