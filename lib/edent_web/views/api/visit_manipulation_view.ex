defmodule EdentWeb.Api.VisitManipulationView do
  use EdentWeb, :view
  alias EdentWeb.Api.VisitManipulationView

  def render("index.json", %{visit_manipulations: visit_manipulations}) do
    %{data: render_many(visit_manipulations, VisitManipulationView, "visit_manipulation.json")}
  end

  def render("show.json", %{visit_manipulation: visit_manipulation}) do
    %{data: render_one(visit_manipulation, VisitManipulationView, "visit_manipulation.json")}
  end

  def render("visit_manipulation.json", %{visit_manipulation: visit_manipulation}) do
    %{id: visit_manipulation.id}
  end
end
