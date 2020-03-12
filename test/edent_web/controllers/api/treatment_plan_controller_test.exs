defmodule EdentWeb.Api.TreatmentPlanControllerTest do
  use EdentWeb.ConnCase

  alias Edent.TreatmentPlans
  alias Edent.TreatmentPlans.TreatmentPlan

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:treatment_plan) do
    {:ok, treatment_plan} = TreatmentPlans.create_treatment_plan(@create_attrs)
    treatment_plan
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all treatment_plans", %{conn: conn} do
      conn = get(conn, Routes.api_treatment_plan_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create treatment_plan" do
    test "renders treatment_plan when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_treatment_plan_path(conn, :create), treatment_plan: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_treatment_plan_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_treatment_plan_path(conn, :create), treatment_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update treatment_plan" do
    setup [:create_treatment_plan]

    test "renders treatment_plan when data is valid", %{conn: conn, treatment_plan: %TreatmentPlan{id: id} = treatment_plan} do
      conn = put(conn, Routes.api_treatment_plan_path(conn, :update, treatment_plan), treatment_plan: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_treatment_plan_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, treatment_plan: treatment_plan} do
      conn = put(conn, Routes.api_treatment_plan_path(conn, :update, treatment_plan), treatment_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete treatment_plan" do
    setup [:create_treatment_plan]

    test "deletes chosen treatment_plan", %{conn: conn, treatment_plan: treatment_plan} do
      conn = delete(conn, Routes.api_treatment_plan_path(conn, :delete, treatment_plan))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_treatment_plan_path(conn, :show, treatment_plan))
      end
    end
  end

  defp create_treatment_plan(_) do
    treatment_plan = fixture(:treatment_plan)
    {:ok, treatment_plan: treatment_plan}
  end
end
