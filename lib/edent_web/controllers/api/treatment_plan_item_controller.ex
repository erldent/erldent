defmodule EdentWeb.Api.TreatmentPlanItemController do
  use EdentWeb, :controller

  alias Edent.TreatmentPlanItems
  alias Edent.TreatmentPlanItems.TreatmentPlanItem

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    treatment_plan_items = TreatmentPlanItems.list_treatment_plan_items()
    render(conn, "index.json", treatment_plan_items: treatment_plan_items)
  end

  def create(conn, %{"treatment_plan_item" => treatment_plan_item_params}) do
    with {:ok, %TreatmentPlanItem{} = treatment_plan_item} <- TreatmentPlanItems.create_treatment_plan_item(treatment_plan_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_treatment_plan_item_path(conn, :show, treatment_plan_item))
      |> render("show.json", treatment_plan_item: treatment_plan_item)
    end
  end

  def show(conn, %{"id" => id}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)
    render(conn, "show.json", treatment_plan_item: treatment_plan_item)
  end

  def update(conn, %{"id" => id, "treatment_plan_item" => treatment_plan_item_params}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)

    with {:ok, %TreatmentPlanItem{} = treatment_plan_item} <- TreatmentPlanItems.update_treatment_plan_item(treatment_plan_item, treatment_plan_item_params) do
      render(conn, "show.json", treatment_plan_item: treatment_plan_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)

    with {:ok, %TreatmentPlanItem{}} <- TreatmentPlanItems.delete_treatment_plan_item(treatment_plan_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
