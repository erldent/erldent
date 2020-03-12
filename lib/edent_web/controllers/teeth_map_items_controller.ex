defmodule EdentWeb.TeethMapItemsController do
  use EdentWeb, :controller

  alias Edent.Teethmap
  alias Edent.Teethmap.TeethMapItems

  def index(conn, _params) do
    teethmap = Teethmap.list_teethmap()
    render(conn, "index.html", teethmap: teethmap)
  end

  def new(conn, _params) do
    changeset = Teethmap.change_teeth_map_items(%TeethMapItems{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"teeth_map_items" => teeth_map_items_params}) do
    case Teethmap.create_teeth_map_items(teeth_map_items_params) do
      {:ok, teeth_map_items} ->
        conn
        |> put_flash(:info, "Teeth map items created successfully.")
        |> redirect(to: Routes.teeth_map_items_path(conn, :show, teeth_map_items))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)
    render(conn, "show.html", teeth_map_items: teeth_map_items)
  end

  def edit(conn, %{"id" => id}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)
    changeset = Teethmap.change_teeth_map_items(teeth_map_items)
    render(conn, "edit.html", teeth_map_items: teeth_map_items, changeset: changeset)
  end

  def update(conn, %{"id" => id, "teeth_map_items" => teeth_map_items_params}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)

    case Teethmap.update_teeth_map_items(teeth_map_items, teeth_map_items_params) do
      {:ok, teeth_map_items} ->
        conn
        |> put_flash(:info, "Teeth map items updated successfully.")
        |> redirect(to: Routes.teeth_map_items_path(conn, :show, teeth_map_items))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", teeth_map_items: teeth_map_items, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    teeth_map_items = Teethmap.get_teeth_map_items!(id)
    {:ok, _teeth_map_items} = Teethmap.delete_teeth_map_items(teeth_map_items)

    conn
    |> put_flash(:info, "Teeth map items deleted successfully.")
    |> redirect(to: Routes.teeth_map_items_path(conn, :index))
  end
end
