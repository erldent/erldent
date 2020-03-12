defmodule EdentWeb.Api.ManipulationControllerTest do
  use EdentWeb.ConnCase

  alias Edent.Manipulations
  alias Edent.Manipulations.Manipulation

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:manipulation) do
    {:ok, manipulation} = Manipulations.create_manipulation(@create_attrs)
    manipulation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all manipulations", %{conn: conn} do
      conn = get(conn, Routes.api_manipulation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create manipulation" do
    test "renders manipulation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_manipulation_path(conn, :create), manipulation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_manipulation_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_manipulation_path(conn, :create), manipulation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update manipulation" do
    setup [:create_manipulation]

    test "renders manipulation when data is valid", %{conn: conn, manipulation: %Manipulation{id: id} = manipulation} do
      conn = put(conn, Routes.api_manipulation_path(conn, :update, manipulation), manipulation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_manipulation_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, manipulation: manipulation} do
      conn = put(conn, Routes.api_manipulation_path(conn, :update, manipulation), manipulation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete manipulation" do
    setup [:create_manipulation]

    test "deletes chosen manipulation", %{conn: conn, manipulation: manipulation} do
      conn = delete(conn, Routes.api_manipulation_path(conn, :delete, manipulation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_manipulation_path(conn, :show, manipulation))
      end
    end
  end

  defp create_manipulation(_) do
    manipulation = fixture(:manipulation)
    {:ok, manipulation: manipulation}
  end
end
