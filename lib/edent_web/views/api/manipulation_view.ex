defmodule EdentWeb.Api.ManipulationView do
  use EdentWeb, :view
  alias EdentWeb.Api.ManipulationView

  def render("index.json", %{manipulations: manipulations}) do
    %{data: render_many(manipulations, ManipulationView, "manipulation.json")}
  end

  def render("show.json", %{manipulation: manipulation}) do
    %{data: render_one(manipulation, ManipulationView, "manipulation.json")}
  end

  def render("manipulation.json", %{manipulation: manipulation}) do
    %{id: manipulation.id}
  end
end
