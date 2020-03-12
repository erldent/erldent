defmodule EdentWeb.VisitManipulationController do
  use EdentWeb, :controller

  alias Edent.VisitManipulations
  alias Edent.VisitManipulations.VisitManipulation

  def index(conn, _params) do
    visit_manipulations = VisitManipulations.list_visit_manipulations()
    render(conn, "index.html", visit_manipulations: visit_manipulations)
  end

  def new(conn, _params) do
    changeset = VisitManipulations.change_visit_manipulation(%VisitManipulation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visit_manipulation" => visit_manipulation_params}) do
    case VisitManipulations.create_visit_manipulation(visit_manipulation_params) do
      {:ok, visit_manipulation} ->
        conn
        |> put_flash(:info, "Visit manipulation created successfully.")
        |> redirect(to: Routes.visit_manipulation_path(conn, :show, visit_manipulation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)
    render(conn, "show.html", visit_manipulation: visit_manipulation)
  end

  def edit(conn, %{"id" => id}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)
    changeset = VisitManipulations.change_visit_manipulation(visit_manipulation)
    render(conn, "edit.html", visit_manipulation: visit_manipulation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visit_manipulation" => visit_manipulation_params}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)

    case VisitManipulations.update_visit_manipulation(visit_manipulation, visit_manipulation_params) do
      {:ok, visit_manipulation} ->
        conn
        |> put_flash(:info, "Visit manipulation updated successfully.")
        |> redirect(to: Routes.visit_manipulation_path(conn, :show, visit_manipulation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visit_manipulation: visit_manipulation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)
    {:ok, _visit_manipulation} = VisitManipulations.delete_visit_manipulation(visit_manipulation)

    conn
    |> put_flash(:info, "Visit manipulation deleted successfully.")
    |> redirect(to: Routes.visit_manipulation_path(conn, :index))
  end
end
