defmodule EdentWeb.TeethMapItemsControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Teethmap

  @create_attrs %{comments: "some comments", t: ~D[2010-04-17], tooth: 42}
  @update_attrs %{comments: "some updated comments", t: ~D[2011-05-18], tooth: 43}
  @invalid_attrs %{comments: nil, t: nil, tooth: nil}

  def fixture(:teeth_map_items) do
    {:ok, teeth_map_items} = Teethmap.create_teeth_map_items(@create_attrs)
    teeth_map_items
  end

  describe "index" do
    test "lists all teethmap", %{conn: conn} do
      conn = get(conn, Routes.teeth_map_items_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Teethmap"
    end
  end

  describe "new teeth_map_items" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.teeth_map_items_path(conn, :new))
      assert html_response(conn, 200) =~ "New Teeth map items"
    end
  end

  describe "create teeth_map_items" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.teeth_map_items_path(conn, :create), teeth_map_items: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.teeth_map_items_path(conn, :show, id)

      conn = get(conn, Routes.teeth_map_items_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Teeth map items"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.teeth_map_items_path(conn, :create), teeth_map_items: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Teeth map items"
    end
  end

  describe "edit teeth_map_items" do
    setup [:create_teeth_map_items]

    test "renders form for editing chosen teeth_map_items", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = get(conn, Routes.teeth_map_items_path(conn, :edit, teeth_map_items))
      assert html_response(conn, 200) =~ "Edit Teeth map items"
    end
  end

  describe "update teeth_map_items" do
    setup [:create_teeth_map_items]

    test "redirects when data is valid", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = put(conn, Routes.teeth_map_items_path(conn, :update, teeth_map_items), teeth_map_items: @update_attrs)
      assert redirected_to(conn) == Routes.teeth_map_items_path(conn, :show, teeth_map_items)

      conn = get(conn, Routes.teeth_map_items_path(conn, :show, teeth_map_items))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = put(conn, Routes.teeth_map_items_path(conn, :update, teeth_map_items), teeth_map_items: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Teeth map items"
    end
  end

  describe "delete teeth_map_items" do
    setup [:create_teeth_map_items]

    test "deletes chosen teeth_map_items", %{conn: conn, teeth_map_items: teeth_map_items} do
      conn = delete(conn, Routes.teeth_map_items_path(conn, :delete, teeth_map_items))
      assert redirected_to(conn) == Routes.teeth_map_items_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.teeth_map_items_path(conn, :show, teeth_map_items))
      end
    end
  end

  defp create_teeth_map_items(_) do
    teeth_map_items = fixture(:teeth_map_items)
    {:ok, teeth_map_items: teeth_map_items}
  end
end
