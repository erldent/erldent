defmodule EdentWeb.DoctorScheduleEntryControllerTest do
  use EdentWeb.ConnCase

  alias Edent.DoctorSchedule

  @create_attrs %{d: ~D[2010-04-17], t1: ~T[14:00:00], t2: ~T[14:00:00]}
  @update_attrs %{d: ~D[2011-05-18], t1: ~T[15:01:01], t2: ~T[15:01:01]}
  @invalid_attrs %{d: nil, t1: nil, t2: nil}

  def fixture(:doctor_schedule_entry) do
    {:ok, doctor_schedule_entry} = DoctorSchedule.create_doctor_schedule_entry(@create_attrs)
    doctor_schedule_entry
  end

  describe "index" do
    test "lists all doctor_schedule", %{conn: conn} do
      conn = get(conn, Routes.doctor_schedule_entry_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Doctor schedule"
    end
  end

  describe "new doctor_schedule_entry" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.doctor_schedule_entry_path(conn, :new))
      assert html_response(conn, 200) =~ "New Doctor schedule entry"
    end
  end

  describe "create doctor_schedule_entry" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.doctor_schedule_entry_path(conn, :create), doctor_schedule_entry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.doctor_schedule_entry_path(conn, :show, id)

      conn = get(conn, Routes.doctor_schedule_entry_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Doctor schedule entry"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.doctor_schedule_entry_path(conn, :create), doctor_schedule_entry: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Doctor schedule entry"
    end
  end

  describe "edit doctor_schedule_entry" do
    setup [:create_doctor_schedule_entry]

    test "renders form for editing chosen doctor_schedule_entry", %{conn: conn, doctor_schedule_entry: doctor_schedule_entry} do
      conn = get(conn, Routes.doctor_schedule_entry_path(conn, :edit, doctor_schedule_entry))
      assert html_response(conn, 200) =~ "Edit Doctor schedule entry"
    end
  end

  describe "update doctor_schedule_entry" do
    setup [:create_doctor_schedule_entry]

    test "redirects when data is valid", %{conn: conn, doctor_schedule_entry: doctor_schedule_entry} do
      conn = put(conn, Routes.doctor_schedule_entry_path(conn, :update, doctor_schedule_entry), doctor_schedule_entry: @update_attrs)
      assert redirected_to(conn) == Routes.doctor_schedule_entry_path(conn, :show, doctor_schedule_entry)

      conn = get(conn, Routes.doctor_schedule_entry_path(conn, :show, doctor_schedule_entry))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, doctor_schedule_entry: doctor_schedule_entry} do
      conn = put(conn, Routes.doctor_schedule_entry_path(conn, :update, doctor_schedule_entry), doctor_schedule_entry: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Doctor schedule entry"
    end
  end

  describe "delete doctor_schedule_entry" do
    setup [:create_doctor_schedule_entry]

    test "deletes chosen doctor_schedule_entry", %{conn: conn, doctor_schedule_entry: doctor_schedule_entry} do
      conn = delete(conn, Routes.doctor_schedule_entry_path(conn, :delete, doctor_schedule_entry))
      assert redirected_to(conn) == Routes.doctor_schedule_entry_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.doctor_schedule_entry_path(conn, :show, doctor_schedule_entry))
      end
    end
  end

  defp create_doctor_schedule_entry(_) do
    doctor_schedule_entry = fixture(:doctor_schedule_entry)
    {:ok, doctor_schedule_entry: doctor_schedule_entry}
  end
end
