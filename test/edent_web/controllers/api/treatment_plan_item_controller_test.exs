defmodule EdentWeb.Api.TreatmentPlanItemControllerTest do
  use EdentWeb.ConnCase

  alias Edent.TreatmentPlanItems
  alias Edent.TreatmentPlanItems.TreatmentPlanItem

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:treatment_plan_item) do
    {:ok, treatment_plan_item} = TreatmentPlanItems.create_treatment_plan_item(@create_attrs)
    treatment_plan_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all treatment_plan_items", %{conn: conn} do
      conn = get(conn, Routes.api_treatment_plan_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create treatment_plan_item" do
    test "renders treatment_plan_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_treatment_plan_item_path(conn, :create), treatment_plan_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_treatment_plan_item_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_treatment_plan_item_path(conn, :create), treatment_plan_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update treatment_plan_item" do
    setup [:create_treatment_plan_item]

    test "renders treatment_plan_item when data is valid", %{conn: conn, treatment_plan_item: %TreatmentPlanItem{id: id} = treatment_plan_item} do
      conn = put(conn, Routes.api_treatment_plan_item_path(conn, :update, treatment_plan_item), treatment_plan_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_treatment_plan_item_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = put(conn, Routes.api_treatment_plan_item_path(conn, :update, treatment_plan_item), treatment_plan_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete treatment_plan_item" do
    setup [:create_treatment_plan_item]

    test "deletes chosen treatment_plan_item", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = delete(conn, Routes.api_treatment_plan_item_path(conn, :delete, treatment_plan_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_treatment_plan_item_path(conn, :show, treatment_plan_item))
      end
    end
  end

  defp create_treatment_plan_item(_) do
    treatment_plan_item = fixture(:treatment_plan_item)
    {:ok, treatment_plan_item: treatment_plan_item}
  end
end
