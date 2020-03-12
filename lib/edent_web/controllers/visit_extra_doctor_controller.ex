defmodule EdentWeb.VisitExtraDoctorController do
  use EdentWeb, :controller

  alias Edent.VisitExtraDoctors
  alias Edent.VisitExtraDoctors.VisitExtraDoctor

  def index(conn, _params) do
    visit_extra_doctors = VisitExtraDoctors.list_visit_extra_doctors()
    render(conn, "index.html", visit_extra_doctors: visit_extra_doctors)
  end

  def new(conn, _params) do
    changeset = VisitExtraDoctors.change_visit_extra_doctor(%VisitExtraDoctor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visit_extra_doctor" => visit_extra_doctor_params}) do
    case VisitExtraDoctors.create_visit_extra_doctor(visit_extra_doctor_params) do
      {:ok, visit_extra_doctor} ->
        conn
        |> put_flash(:info, "Visit extra doctor created successfully.")
        |> redirect(to: Routes.visit_extra_doctor_path(conn, :show, visit_extra_doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)
    render(conn, "show.html", visit_extra_doctor: visit_extra_doctor)
  end

  def edit(conn, %{"id" => id}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)
    changeset = VisitExtraDoctors.change_visit_extra_doctor(visit_extra_doctor)
    render(conn, "edit.html", visit_extra_doctor: visit_extra_doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visit_extra_doctor" => visit_extra_doctor_params}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)

    case VisitExtraDoctors.update_visit_extra_doctor(visit_extra_doctor, visit_extra_doctor_params) do
      {:ok, visit_extra_doctor} ->
        conn
        |> put_flash(:info, "Visit extra doctor updated successfully.")
        |> redirect(to: Routes.visit_extra_doctor_path(conn, :show, visit_extra_doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visit_extra_doctor: visit_extra_doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)
    {:ok, _visit_extra_doctor} = VisitExtraDoctors.delete_visit_extra_doctor(visit_extra_doctor)

    conn
    |> put_flash(:info, "Visit extra doctor deleted successfully.")
    |> redirect(to: Routes.visit_extra_doctor_path(conn, :index))
  end
end
