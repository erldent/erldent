defmodule EdentWeb.VisitManipulationControllerTest do
  use EdentWeb.ConnCase

  alias Edent.VisitManipulations

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:visit_manipulation) do
    {:ok, visit_manipulation} = VisitManipulations.create_visit_manipulation(@create_attrs)
    visit_manipulation
  end

  describe "index" do
    test "lists all visit_manipulations", %{conn: conn} do
      conn = get(conn, Routes.visit_manipulation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visit manipulations"
    end
  end

  describe "new visit_manipulation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visit_manipulation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visit manipulation"
    end
  end

  describe "create visit_manipulation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visit_manipulation_path(conn, :create), visit_manipulation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visit_manipulation_path(conn, :show, id)

      conn = get(conn, Routes.visit_manipulation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visit manipulation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visit_manipulation_path(conn, :create), visit_manipulation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visit manipulation"
    end
  end

  describe "edit visit_manipulation" do
    setup [:create_visit_manipulation]

    test "renders form for editing chosen visit_manipulation", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = get(conn, Routes.visit_manipulation_path(conn, :edit, visit_manipulation))
      assert html_response(conn, 200) =~ "Edit Visit manipulation"
    end
  end

  describe "update visit_manipulation" do
    setup [:create_visit_manipulation]

    test "redirects when data is valid", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = put(conn, Routes.visit_manipulation_path(conn, :update, visit_manipulation), visit_manipulation: @update_attrs)
      assert redirected_to(conn) == Routes.visit_manipulation_path(conn, :show, visit_manipulation)

      conn = get(conn, Routes.visit_manipulation_path(conn, :show, visit_manipulation))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = put(conn, Routes.visit_manipulation_path(conn, :update, visit_manipulation), visit_manipulation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visit manipulation"
    end
  end

  describe "delete visit_manipulation" do
    setup [:create_visit_manipulation]

    test "deletes chosen visit_manipulation", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = delete(conn, Routes.visit_manipulation_path(conn, :delete, visit_manipulation))
      assert redirected_to(conn) == Routes.visit_manipulation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visit_manipulation_path(conn, :show, visit_manipulation))
      end
    end
  end

  defp create_visit_manipulation(_) do
    visit_manipulation = fixture(:visit_manipulation)
    {:ok, visit_manipulation: visit_manipulation}
  end
end
