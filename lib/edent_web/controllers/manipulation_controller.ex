defmodule EdentWeb.ManipulationController do
  use EdentWeb, :controller

  alias Edent.Manipulations
  alias Edent.Manipulations.Manipulation

  def index(conn, _params) do
    manipulations = Manipulations.list_manipulations()
    render(conn, "index.html", manipulations: manipulations)
  end

  def new(conn, _params) do
    changeset = Manipulations.change_manipulation(%Manipulation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"manipulation" => manipulation_params}) do
    case Manipulations.create_manipulation(manipulation_params) do
      {:ok, manipulation} ->
        conn
        |> put_flash(:info, "Manipulation created successfully.")
        |> redirect(to: Routes.manipulation_path(conn, :show, manipulation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manipulation = Manipulations.get_manipulation!(id)
    render(conn, "show.html", manipulation: manipulation)
  end

  def edit(conn, %{"id" => id}) do
    manipulation = Manipulations.get_manipulation!(id)
    changeset = Manipulations.change_manipulation(manipulation)
    render(conn, "edit.html", manipulation: manipulation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "manipulation" => manipulation_params}) do
    manipulation = Manipulations.get_manipulation!(id)

    case Manipulations.update_manipulation(manipulation, manipulation_params) do
      {:ok, manipulation} ->
        conn
        |> put_flash(:info, "Manipulation updated successfully.")
        |> redirect(to: Routes.manipulation_path(conn, :show, manipulation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", manipulation: manipulation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manipulation = Manipulations.get_manipulation!(id)
    {:ok, _manipulation} = Manipulations.delete_manipulation(manipulation)

    conn
    |> put_flash(:info, "Manipulation deleted successfully.")
    |> redirect(to: Routes.manipulation_path(conn, :index))
  end
end
