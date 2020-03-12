defmodule EdentWeb.TreatmentPlanControllerTest do
  use EdentWeb.ConnCase

  alias Edent.TreatmentPlans

  @create_attrs %{created: ~N[2010-04-17 14:00:00], finish_schedule: ~N[2010-04-17 14:00:00], isfinished: true}
  @update_attrs %{created: ~N[2011-05-18 15:01:01], finish_schedule: ~N[2011-05-18 15:01:01], isfinished: false}
  @invalid_attrs %{created: nil, finish_schedule: nil, isfinished: nil}

  def fixture(:treatment_plan) do
    {:ok, treatment_plan} = TreatmentPlans.create_treatment_plan(@create_attrs)
    treatment_plan
  end

  describe "index" do
    test "lists all treatment_plans", %{conn: conn} do
      conn = get(conn, Routes.treatment_plan_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Treatment plans"
    end
  end

  describe "new treatment_plan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.treatment_plan_path(conn, :new))
      assert html_response(conn, 200) =~ "New Treatment plan"
    end
  end

  describe "create treatment_plan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.treatment_plan_path(conn, :create), treatment_plan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.treatment_plan_path(conn, :show, id)

      conn = get(conn, Routes.treatment_plan_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Treatment plan"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.treatment_plan_path(conn, :create), treatment_plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Treatment plan"
    end
  end

  describe "edit treatment_plan" do
    setup [:create_treatment_plan]

    test "renders form for editing chosen treatment_plan", %{conn: conn, treatment_plan: treatment_plan} do
      conn = get(conn, Routes.treatment_plan_path(conn, :edit, treatment_plan))
      assert html_response(conn, 200) =~ "Edit Treatment plan"
    end
  end

  describe "update treatment_plan" do
    setup [:create_treatment_plan]

    test "redirects when data is valid", %{conn: conn, treatment_plan: treatment_plan} do
      conn = put(conn, Routes.treatment_plan_path(conn, :update, treatment_plan), treatment_plan: @update_attrs)
      assert redirected_to(conn) == Routes.treatment_plan_path(conn, :show, treatment_plan)

      conn = get(conn, Routes.treatment_plan_path(conn, :show, treatment_plan))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, treatment_plan: treatment_plan} do
      conn = put(conn, Routes.treatment_plan_path(conn, :update, treatment_plan), treatment_plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Treatment plan"
    end
  end

  describe "delete treatment_plan" do
    setup [:create_treatment_plan]

    test "deletes chosen treatment_plan", %{conn: conn, treatment_plan: treatment_plan} do
      conn = delete(conn, Routes.treatment_plan_path(conn, :delete, treatment_plan))
      assert redirected_to(conn) == Routes.treatment_plan_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.treatment_plan_path(conn, :show, treatment_plan))
      end
    end
  end

  defp create_treatment_plan(_) do
    treatment_plan = fixture(:treatment_plan)
    {:ok, treatment_plan: treatment_plan}
  end
end
