defmodule EdentWeb.ReminderControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Reminders

  @create_attrs %{auto: true, comments: "some comments", t: ~N[2010-04-17 14:00:00], text: "some text"}
  @update_attrs %{auto: false, comments: "some updated comments", t: ~N[2011-05-18 15:01:01], text: "some updated text"}
  @invalid_attrs %{auto: nil, comments: nil, t: nil, text: nil}

  def fixture(:reminder) do
    {:ok, reminder} = Reminders.create_reminder(@create_attrs)
    reminder
  end

  describe "index" do
    test "lists all reminders", %{conn: conn} do
      conn = get(conn, Routes.reminder_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Reminders"
    end
  end

  describe "new reminder" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.reminder_path(conn, :new))
      assert html_response(conn, 200) =~ "New Reminder"
    end
  end

  describe "create reminder" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.reminder_path(conn, :create), reminder: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.reminder_path(conn, :show, id)

      conn = get(conn, Routes.reminder_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Reminder"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.reminder_path(conn, :create), reminder: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Reminder"
    end
  end

  describe "edit reminder" do
    setup [:create_reminder]

    test "renders form for editing chosen reminder", %{conn: conn, reminder: reminder} do
      conn = get(conn, Routes.reminder_path(conn, :edit, reminder))
      assert html_response(conn, 200) =~ "Edit Reminder"
    end
  end

  describe "update reminder" do
    setup [:create_reminder]

    test "redirects when data is valid", %{conn: conn, reminder: reminder} do
      conn = put(conn, Routes.reminder_path(conn, :update, reminder), reminder: @update_attrs)
      assert redirected_to(conn) == Routes.reminder_path(conn, :show, reminder)

      conn = get(conn, Routes.reminder_path(conn, :show, reminder))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, reminder: reminder} do
      conn = put(conn, Routes.reminder_path(conn, :update, reminder), reminder: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Reminder"
    end
  end

  describe "delete reminder" do
    setup [:create_reminder]

    test "deletes chosen reminder", %{conn: conn, reminder: reminder} do
      conn = delete(conn, Routes.reminder_path(conn, :delete, reminder))
      assert redirected_to(conn) == Routes.reminder_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.reminder_path(conn, :show, reminder))
      end
    end
  end

  defp create_reminder(_) do
    reminder = fixture(:reminder)
    {:ok, reminder: reminder}
  end
end
