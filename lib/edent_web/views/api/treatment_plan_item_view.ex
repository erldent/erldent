defmodule EdentWeb.Api.TreatmentPlanItemView do
  use EdentWeb, :view
  alias EdentWeb.Api.TreatmentPlanItemView

  def render("index.json", %{treatment_plan_items: treatment_plan_items}) do
    %{data: render_many(treatment_plan_items, TreatmentPlanItemView, "treatment_plan_item.json")}
  end

  def render("show.json", %{treatment_plan_item: treatment_plan_item}) do
    %{data: render_one(treatment_plan_item, TreatmentPlanItemView, "treatment_plan_item.json")}
  end

  def render("treatment_plan_item.json", %{treatment_plan_item: treatment_plan_item}) do
    %{id: treatment_plan_item.id}
  end
end
