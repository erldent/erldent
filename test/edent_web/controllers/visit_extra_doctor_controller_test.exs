defmodule EdentWeb.VisitExtraDoctorControllerTest do
  use EdentWeb.ConnCase

  alias Edent.VisitExtraDoctors

  @create_attrs %{comments: "some comments"}
  @update_attrs %{comments: "some updated comments"}
  @invalid_attrs %{comments: nil}

  def fixture(:visit_extra_doctor) do
    {:ok, visit_extra_doctor} = VisitExtraDoctors.create_visit_extra_doctor(@create_attrs)
    visit_extra_doctor
  end

  describe "index" do
    test "lists all visit_extra_doctors", %{conn: conn} do
      conn = get(conn, Routes.visit_extra_doctor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visit extra doctors"
    end
  end

  describe "new visit_extra_doctor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visit_extra_doctor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visit extra doctor"
    end
  end

  describe "create visit_extra_doctor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visit_extra_doctor_path(conn, :create), visit_extra_doctor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visit_extra_doctor_path(conn, :show, id)

      conn = get(conn, Routes.visit_extra_doctor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visit extra doctor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visit_extra_doctor_path(conn, :create), visit_extra_doctor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visit extra doctor"
    end
  end

  describe "edit visit_extra_doctor" do
    setup [:create_visit_extra_doctor]

    test "renders form for editing chosen visit_extra_doctor", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = get(conn, Routes.visit_extra_doctor_path(conn, :edit, visit_extra_doctor))
      assert html_response(conn, 200) =~ "Edit Visit extra doctor"
    end
  end

  describe "update visit_extra_doctor" do
    setup [:create_visit_extra_doctor]

    test "redirects when data is valid", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = put(conn, Routes.visit_extra_doctor_path(conn, :update, visit_extra_doctor), visit_extra_doctor: @update_attrs)
      assert redirected_to(conn) == Routes.visit_extra_doctor_path(conn, :show, visit_extra_doctor)

      conn = get(conn, Routes.visit_extra_doctor_path(conn, :show, visit_extra_doctor))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = put(conn, Routes.visit_extra_doctor_path(conn, :update, visit_extra_doctor), visit_extra_doctor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visit extra doctor"
    end
  end

  describe "delete visit_extra_doctor" do
    setup [:create_visit_extra_doctor]

    test "deletes chosen visit_extra_doctor", %{conn: conn, visit_extra_doctor: visit_extra_doctor} do
      conn = delete(conn, Routes.visit_extra_doctor_path(conn, :delete, visit_extra_doctor))
      assert redirected_to(conn) == Routes.visit_extra_doctor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visit_extra_doctor_path(conn, :show, visit_extra_doctor))
      end
    end
  end

  defp create_visit_extra_doctor(_) do
    visit_extra_doctor = fixture(:visit_extra_doctor)
    {:ok, visit_extra_doctor: visit_extra_doctor}
  end
end
