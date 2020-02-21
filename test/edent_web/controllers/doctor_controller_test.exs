defmodule EdentWeb.DoctorControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Doctors

  @create_attrs %{fname: "some fname", lname: "some lname", pname: "some pname"}
  @update_attrs %{fname: "some updated fname", lname: "some updated lname", pname: "some updated pname"}
  @invalid_attrs %{fname: nil, lname: nil, pname: nil}

  def fixture(:doctor) do
    {:ok, doctor} = Doctors.create_doctor(@create_attrs)
    doctor
  end

  describe "index" do
    test "lists all doctors", %{conn: conn} do
      conn = get(conn, Routes.doctor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Doctors"
    end
  end

  describe "new doctor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.doctor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Doctor"
    end
  end

  describe "create doctor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.doctor_path(conn, :create), doctor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.doctor_path(conn, :show, id)

      conn = get(conn, Routes.doctor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Doctor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.doctor_path(conn, :create), doctor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Doctor"
    end
  end

  describe "edit doctor" do
    setup [:create_doctor]

    test "renders form for editing chosen doctor", %{conn: conn, doctor: doctor} do
      conn = get(conn, Routes.doctor_path(conn, :edit, doctor))
      assert html_response(conn, 200) =~ "Edit Doctor"
    end
  end

  describe "update doctor" do
    setup [:create_doctor]

    test "redirects when data is valid", %{conn: conn, doctor: doctor} do
      conn = put(conn, Routes.doctor_path(conn, :update, doctor), doctor: @update_attrs)
      assert redirected_to(conn) == Routes.doctor_path(conn, :show, doctor)

      conn = get(conn, Routes.doctor_path(conn, :show, doctor))
      assert html_response(conn, 200) =~ "some updated fname"
    end

    test "renders errors when data is invalid", %{conn: conn, doctor: doctor} do
      conn = put(conn, Routes.doctor_path(conn, :update, doctor), doctor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Doctor"
    end
  end

  describe "delete doctor" do
    setup [:create_doctor]

    test "deletes chosen doctor", %{conn: conn, doctor: doctor} do
      conn = delete(conn, Routes.doctor_path(conn, :delete, doctor))
      assert redirected_to(conn) == Routes.doctor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.doctor_path(conn, :show, doctor))
      end
    end
  end

  defp create_doctor(_) do
    doctor = fixture(:doctor)
    {:ok, doctor: doctor}
  end
end
