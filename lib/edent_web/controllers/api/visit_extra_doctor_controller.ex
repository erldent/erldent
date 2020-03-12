defmodule EdentWeb.Api.VisitExtraDoctorController do
  use EdentWeb, :controller

  alias Edent.VisitExtraDoctors
  alias Edent.VisitExtraDoctors.VisitExtraDoctor

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    visit_extra_doctors = VisitExtraDoctors.list_visit_extra_doctors()
    render(conn, "index.json", visit_extra_doctors: visit_extra_doctors)
  end

  def create(conn, %{"visit_extra_doctor" => visit_extra_doctor_params}) do
    with {:ok, %VisitExtraDoctor{} = visit_extra_doctor} <- VisitExtraDoctors.create_visit_extra_doctor(visit_extra_doctor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_visit_extra_doctor_path(conn, :show, visit_extra_doctor))
      |> render("show.json", visit_extra_doctor: visit_extra_doctor)
    end
  end

  def show(conn, %{"id" => id}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)
    render(conn, "show.json", visit_extra_doctor: visit_extra_doctor)
  end

  def update(conn, %{"id" => id, "visit_extra_doctor" => visit_extra_doctor_params}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)

    with {:ok, %VisitExtraDoctor{} = visit_extra_doctor} <- VisitExtraDoctors.update_visit_extra_doctor(visit_extra_doctor, visit_extra_doctor_params) do
      render(conn, "show.json", visit_extra_doctor: visit_extra_doctor)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit_extra_doctor = VisitExtraDoctors.get_visit_extra_doctor!(id)

    with {:ok, %VisitExtraDoctor{}} <- VisitExtraDoctors.delete_visit_extra_doctor(visit_extra_doctor) do
      send_resp(conn, :no_content, "")
    end
  end
end
