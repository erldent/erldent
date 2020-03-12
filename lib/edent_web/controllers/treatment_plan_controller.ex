defmodule EdentWeb.TreatmentPlanController do
  use EdentWeb, :controller

  alias Edent.TreatmentPlans
  alias Edent.TreatmentPlans.TreatmentPlan

  def index(conn, _params) do
    treatment_plans = TreatmentPlans.list_treatment_plans()
    render(conn, "index.html", treatment_plans: treatment_plans)
  end

  def new(conn, _params) do
    changeset = TreatmentPlans.change_treatment_plan(%TreatmentPlan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"treatment_plan" => treatment_plan_params}) do
    case TreatmentPlans.create_treatment_plan(treatment_plan_params) do
      {:ok, treatment_plan} ->
        conn
        |> put_flash(:info, "Treatment plan created successfully.")
        |> redirect(to: Routes.treatment_plan_path(conn, :show, treatment_plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)
    render(conn, "show.html", treatment_plan: treatment_plan)
  end

  def edit(conn, %{"id" => id}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)
    changeset = TreatmentPlans.change_treatment_plan(treatment_plan)
    render(conn, "edit.html", treatment_plan: treatment_plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "treatment_plan" => treatment_plan_params}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)

    case TreatmentPlans.update_treatment_plan(treatment_plan, treatment_plan_params) do
      {:ok, treatment_plan} ->
        conn
        |> put_flash(:info, "Treatment plan updated successfully.")
        |> redirect(to: Routes.treatment_plan_path(conn, :show, treatment_plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", treatment_plan: treatment_plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    treatment_plan = TreatmentPlans.get_treatment_plan!(id)
    {:ok, _treatment_plan} = TreatmentPlans.delete_treatment_plan(treatment_plan)

    conn
    |> put_flash(:info, "Treatment plan deleted successfully.")
    |> redirect(to: Routes.treatment_plan_path(conn, :index))
  end
end
