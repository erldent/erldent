defmodule EdentWeb.ManipulationControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Manipulations

  @create_attrs %{cost: "120.5", discount_max: "120.5", kind: "some kind", title: "some title"}
  @update_attrs %{cost: "456.7", discount_max: "456.7", kind: "some updated kind", title: "some updated title"}
  @invalid_attrs %{cost: nil, discount_max: nil, kind: nil, title: nil}

  def fixture(:manipulation) do
    {:ok, manipulation} = Manipulations.create_manipulation(@create_attrs)
    manipulation
  end

  describe "index" do
    test "lists all manipulations", %{conn: conn} do
      conn = get(conn, Routes.manipulation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Manipulations"
    end
  end

  describe "new manipulation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.manipulation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Manipulation"
    end
  end

  describe "create manipulation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.manipulation_path(conn, :create), manipulation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.manipulation_path(conn, :show, id)

      conn = get(conn, Routes.manipulation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Manipulation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.manipulation_path(conn, :create), manipulation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Manipulation"
    end
  end

  describe "edit manipulation" do
    setup [:create_manipulation]

    test "renders form for editing chosen manipulation", %{conn: conn, manipulation: manipulation} do
      conn = get(conn, Routes.manipulation_path(conn, :edit, manipulation))
      assert html_response(conn, 200) =~ "Edit Manipulation"
    end
  end

  describe "update manipulation" do
    setup [:create_manipulation]

    test "redirects when data is valid", %{conn: conn, manipulation: manipulation} do
      conn = put(conn, Routes.manipulation_path(conn, :update, manipulation), manipulation: @update_attrs)
      assert redirected_to(conn) == Routes.manipulation_path(conn, :show, manipulation)

      conn = get(conn, Routes.manipulation_path(conn, :show, manipulation))
      assert html_response(conn, 200) =~ "some updated kind"
    end

    test "renders errors when data is invalid", %{conn: conn, manipulation: manipulation} do
      conn = put(conn, Routes.manipulation_path(conn, :update, manipulation), manipulation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Manipulation"
    end
  end

  describe "delete manipulation" do
    setup [:create_manipulation]

    test "deletes chosen manipulation", %{conn: conn, manipulation: manipulation} do
      conn = delete(conn, Routes.manipulation_path(conn, :delete, manipulation))
      assert redirected_to(conn) == Routes.manipulation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.manipulation_path(conn, :show, manipulation))
      end
    end
  end

  defp create_manipulation(_) do
    manipulation = fixture(:manipulation)
    {:ok, manipulation: manipulation}
  end
end
