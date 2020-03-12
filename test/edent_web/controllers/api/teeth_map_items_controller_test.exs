defmodule EdentWeb.Api.TeethMapItemsControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Teethmap
  alias Edent.Teethmap.TeethMapItems

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:teeth_map_items) do
    {:ok, teeth_map_items} = Teethmap.create_teeth_map_items(@create_attrs)
    teeth_map_items
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all teethmap", %{conn: conn} do
      conn = get(conn, Routes.api_teeth_map_items_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create teeth_map_items" do
    test "renders teeth_map_items when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_teeth_map_items_path(conn, :create), teeth_map_items: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_teeth_map_items_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_teeth_map_items_path(conn, :create), teeth_map_items: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update teeth_map_items" do
    setup [:create_teeth_map_items]

    test "renders teeth_map_items when data is valid", %{conn: conn, teeth_map_items: %TeethMapItems{id: id} = teeth_map_items} do
      conn = put(conn, Routes.api_teeth_map_items_path(conn, :update, teeth_map_items), teeth_map_items: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_teeth_map_items_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = put(conn, Routes.api_teeth_map_items_path(conn, :update, teeth_map_items), teeth_map_items: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete teeth_map_items" do
    setup [:create_teeth_map_items]

    test "deletes chosen teeth_map_items", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = delete(conn, Routes.api_teeth_map_items_path(conn, :delete, teeth_map_items))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_teeth_map_items_path(conn, :show, teeth_map_items))
      end
    end
  end

  defp create_teeth_map_items(_) do
    teeth_map_items = fixture(:teeth_map_items)
    {:ok, teeth_map_items: teeth_map_items}
  end
end
