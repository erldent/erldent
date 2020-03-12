defmodule EdentWeb.Api.TreatmentPlanView do
  use EdentWeb, :view
  alias EdentWeb.Api.TreatmentPlanView

  def render("index.json", %{treatment_plans: treatment_plans}) do
    %{data: render_many(treatment_plans, TreatmentPlanView, "treatment_plan.json")}
  end

  def render("show.json", %{treatment_plan: treatment_plan}) do
    %{data: render_one(treatment_plan, TreatmentPlanView, "treatment_plan.json")}
  end

  def render("treatment_plan.json", %{treatment_plan: treatment_plan}) do
    %{id: treatment_plan.id}
  end
end
