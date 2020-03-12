defmodule EdentWeb.Api.VisitManipulationControllerTest do
  use EdentWeb.ConnCase

  alias Edent.VisitManipulations
  alias Edent.VisitManipulations.VisitManipulation

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:visit_manipulation) do
    {:ok, visit_manipulation} = VisitManipulations.create_visit_manipulation(@create_attrs)
    visit_manipulation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all visit_manipulations", %{conn: conn} do
      conn = get(conn, Routes.api_visit_manipulation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create visit_manipulation" do
    test "renders visit_manipulation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_visit_manipulation_path(conn, :create), visit_manipulation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_visit_manipulation_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_visit_manipulation_path(conn, :create), visit_manipulation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update visit_manipulation" do
    setup [:create_visit_manipulation]

    test "renders visit_manipulation when data is valid", %{conn: conn, visit_manipulation: %VisitManipulation{id: id} = visit_manipulation} do
      conn = put(conn, Routes.api_visit_manipulation_path(conn, :update, visit_manipulation), visit_manipulation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_visit_manipulation_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = put(conn, Routes.api_visit_manipulation_path(conn, :update, visit_manipulation), visit_manipulation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete visit_manipulation" do
    setup [:create_visit_manipulation]

    test "deletes chosen visit_manipulation", %{conn: conn, visit_manipulation: visit_manipulation} do
      conn = delete(conn, Routes.api_visit_manipulation_path(conn, :delete, visit_manipulation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_visit_manipulation_path(conn, :show, visit_manipulation))
      end
    end
  end

  defp create_visit_manipulation(_) do
    visit_manipulation = fixture(:visit_manipulation)
    {:ok, visit_manipulation: visit_manipulation}
  end
end
