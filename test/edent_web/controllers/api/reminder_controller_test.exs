defmodule EdentWeb.Api.ReminderControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Reminders
  alias Edent.Reminders.Reminder

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:reminder) do
    {:ok, reminder} = Reminders.create_reminder(@create_attrs)
    reminder
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reminders", %{conn: conn} do
      conn = get(conn, Routes.api_reminder_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create reminder" do
    test "renders reminder when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_reminder_path(conn, :create), reminder: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_reminder_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_reminder_path(conn, :create), reminder: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update reminder" do
    setup [:create_reminder]

    test "renders reminder when data is valid", %{conn: conn, reminder: %Reminder{id: id} = reminder} do
      conn = put(conn, Routes.api_reminder_path(conn, :update, reminder), reminder: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_reminder_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, reminder: reminder} do
      conn = put(conn, Routes.api_reminder_path(conn, :update, reminder), reminder: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete reminder" do
    setup [:create_reminder]

    test "deletes chosen reminder", %{conn: conn, reminder: reminder} do
      conn = delete(conn, Routes.api_reminder_path(conn, :delete, reminder))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_reminder_path(conn, :show, reminder))
      end
    end
  end

  defp create_reminder(_) do
    reminder = fixture(:reminder)
    {:ok, reminder: reminder}
  end
end
