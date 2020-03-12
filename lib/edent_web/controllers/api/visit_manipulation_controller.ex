defmodule EdentWeb.Api.VisitManipulationController do
  use EdentWeb, :controller

  alias Edent.VisitManipulations
  alias Edent.VisitManipulations.VisitManipulation

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    visit_manipulations = VisitManipulations.list_visit_manipulations()
    render(conn, "index.json", visit_manipulations: visit_manipulations)
  end

  def create(conn, %{"visit_manipulation" => visit_manipulation_params}) do
    with {:ok, %VisitManipulation{} = visit_manipulation} <- VisitManipulations.create_visit_manipulation(visit_manipulation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_visit_manipulation_path(conn, :show, visit_manipulation))
      |> render("show.json", visit_manipulation: visit_manipulation)
    end
  end

  def show(conn, %{"id" => id}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)
    render(conn, "show.json", visit_manipulation: visit_manipulation)
  end

  def update(conn, %{"id" => id, "visit_manipulation" => visit_manipulation_params}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)

    with {:ok, %VisitManipulation{} = visit_manipulation} <- VisitManipulations.update_visit_manipulation(visit_manipulation, visit_manipulation_params) do
      render(conn, "show.json", visit_manipulation: visit_manipulation)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit_manipulation = VisitManipulations.get_visit_manipulation!(id)

    with {:ok, %VisitManipulation{}} <- VisitManipulations.delete_visit_manipulation(visit_manipulation) do
      send_resp(conn, :no_content, "")
    end
  end
end
