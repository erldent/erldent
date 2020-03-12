defmodule EdentWeb.Api.TeethMapItemsView do
  use EdentWeb, :view
  alias EdentWeb.Api.TeethMapItemsView

  def render("index.json", %{teethmap: teethmap}) do
    %{data: render_many(teethmap, TeethMapItemsView, "teeth_map_items.json")}
  end

  def render("show.json", %{teeth_map_items: teeth_map_items}) do
    %{data: render_one(teeth_map_items, TeethMapItemsView, "teeth_map_items.json")}
  end

  def render("teeth_map_items.json", %{teeth_map_items: teeth_map_items}) do
    %{id: teeth_map_items.id}
  end
end
