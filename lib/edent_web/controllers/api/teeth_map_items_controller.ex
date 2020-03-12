defmodule EdentWeb.Api.TeethMapItemsController do
  use EdentWeb, :controller

  alias Edent.Teethmap
  alias Edent.Teethmap.TeethMapItems

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    teethmap = Teethmap.list_teethmap()
    render(conn, "index.json", teethmap: teethmap)
  end

  def create(conn, %{"teeth_map_items" => teeth_map_items_params}) do
    with {:ok, %TeethMapItems{} = teeth_map_items} <- Teethmap.create_teeth_map_items(teeth_map_items_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_teeth_map_items_path(conn, :show, teeth_map_items))
      |> render("show.json", teeth_map_items: teeth_map_items)
    end
  end

  def show(conn, %{"id" => id}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)
    render(conn, "show.json", teeth_map_items: teeth_map_items)
  end

  def update(conn, %{"id" => id, "teeth_map_items" => teeth_map_items_params}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)

    with {:ok, %TeethMapItems{} = teeth_map_items} <- Teethmap.update_teeth_map_items(teeth_map_items, teeth_map_items_params) do
      render(conn, "show.json", teeth_map_items: teeth_map_items)
    end
  end

  def delete(conn, %{"id" => id}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)

    with {:ok, %TeethMapItems{}} <- Teethmap.delete_teeth_map_items(teeth_map_items) do
      send_resp(conn, :no_content, "")
    end
  end
end
