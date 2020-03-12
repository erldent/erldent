defmodule EdentWeb.Api.TreatmentPlanController do
  use EdentWeb, :controller

  alias Edent.TreatmentPlans
  alias Edent.TreatmentPlans.TreatmentPlan

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    treatment_plans = TreatmentPlans.list_treatment_plans()
    render(conn, "index.json", treatment_plans: treatment_plans)
  end

  def create(conn, %{"treatment_plan" => treatment_plan_params}) do
    with {:ok, %TreatmentPlan{} = treatment_plan} <- TreatmentPlans.create_treatment_plan(treatment_plan_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_treatment_plan_path(conn, :show, treatment_plan))
      |> render("show.json", treatment_plan: treatment_plan)
    end
  end

  def show(conn, %{"id" => id}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)
    render(conn, "show.json", treatment_plan: treatment_plan)
  end

  def update(conn, %{"id" => id, "treatment_plan" => treatment_plan_params}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)

    with {:ok, %TreatmentPlan{} = treatment_plan} <- TreatmentPlans.update_treatment_plan(treatment_plan, treatment_plan_params) do
      render(conn, "show.json", treatment_plan: treatment_plan)
    end
  end

  def delete(conn, %{"id" => id}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)

    with {:ok, %TreatmentPlan{}} <- TreatmentPlans.delete_treatment_plan(treatment_plan) do
      send_resp(conn, :no_content, "")
    end
  end
end
