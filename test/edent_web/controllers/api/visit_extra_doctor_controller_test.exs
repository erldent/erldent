defmodule EdentWeb.Api.VisitExtraDoctorControllerTest do
  use EdentWeb.ConnCase

  alias Edent.VisitExtraDoctors
  alias Edent.VisitExtraDoctors.VisitExtraDoctor

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:visit_extra_doctor) do
    {:ok, visit_extra_doctor} = VisitExtraDoctors.create_visit_extra_doctor(@create_attrs)
    visit_extra_doctor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all visit_extra_doctors", %{conn: conn} do
      conn = get(conn, Routes.api_visit_extra_doctor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create visit_extra_doctor" do
    test "renders visit_extra_doctor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_visit_extra_doctor_path(conn, :create), visit_extra_doctor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_visit_extra_doctor_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_visit_extra_doctor_path(conn, :create), visit_extra_doctor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update visit_extra_doctor" do
    setup [:create_visit_extra_doctor]

    test "renders visit_extra_doctor when data is valid", %{conn: conn, visit_extra_doctor: %VisitExtraDoctor{id: id} = visit_extra_doctor} do
      conn = put(conn, Routes.api_visit_extra_doctor_path(conn, :update, visit_extra_doctor), visit_extra_doctor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_visit_extra_doctor_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = put(conn, Routes.api_visit_extra_doctor_path(conn, :update, visit_extra_doctor), visit_extra_doctor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete visit_extra_doctor" do
    setup [:create_visit_extra_doctor]

    test "deletes chosen visit_extra_doctor", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = delete(conn, Routes.api_visit_extra_doctor_path(conn, :delete, visit_extra_doctor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_visit_extra_doctor_path(conn, :show, visit_extra_doctor))
      end
    end
  end

  defp create_visit_extra_doctor(_) do
    visit_extra_doctor = fixture(:visit_extra_doctor)
    {:ok, visit_extra_doctor: visit_extra_doctor}
  end
end
