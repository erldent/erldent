defmodule EdentWeb.Api.DoctorController do
  use EdentWeb, :controller

  alias Edent.Doctors
  alias Edent.Doctors.Doctor

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    doctors = Doctors.list_doctors()
    render(conn, "index.json", doctors: doctors)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    with {:ok, %Doctor{} = doctor} <- Doctors.create_doctor(doctor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_doctor_path(conn, :show, doctor))
      |> render("show.json", doctor: doctor)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    render(conn, "show.json", doctor: doctor)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Doctors.get_doctor!(id)

    with {:ok, %Doctor{} = doctor} <- Doctors.update_doctor(doctor, doctor_params) do
      render(conn, "show.json", doctor: doctor)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)

    with {:ok, %Doctor{}} <- Doctors.delete_doctor(doctor) do
      send_resp(conn, :no_content, "")
    end
  end
end
