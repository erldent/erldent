defmodule EdentWeb.Api.ManipulationController do
  use EdentWeb, :controller

  alias Edent.Manipulations
  alias Edent.Manipulations.Manipulation

  action_fallback EdentWeb.FallbackController

  def index(conn, _params) do
    manipulations = Manipulations.list_manipulations()
    render(conn, "index.json", manipulations: manipulations)
  end

  def create(conn, %{"manipulation" => manipulation_params}) do
    with {:ok, %Manipulation{} = manipulation} <- Manipulations.create_manipulation(manipulation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_manipulation_path(conn, :show, manipulation))
      |> render("show.json", manipulation: manipulation)
    end
  end

  def show(conn, %{"id" => id}) do
    manipulation = Manipulations.get_manipulation!(id)
    render(conn, "show.json", manipulation: manipulation)
  end

  def update(conn, %{"id" => id, "manipulation" => manipulation_params}) do
    manipulation = Manipulations.get_manipulation!(id)

    with {:ok, %Manipulation{} = manipulation} <- Manipulations.update_manipulation(manipulation, manipulation_params) do
      render(conn, "show.json", manipulation: manipulation)
    end
  end

  def delete(conn, %{"id" => id}) do
    manipulation = Manipulations.get_manipulation!(id)

    with {:ok, %Manipulation{}} <- Manipulations.delete_manipulation(manipulation) do
      send_resp(conn, :no_content, "")
    end
  end
end
