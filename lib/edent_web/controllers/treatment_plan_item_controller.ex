defmodule EdentWeb.TreatmentPlanItemController do
  use EdentWeb, :controller

  alias Edent.TreatmentPlanItems
  alias Edent.TreatmentPlanItems.TreatmentPlanItem

  def index(conn, _params) do
    treatment_plan_items = TreatmentPlanItems.list_treatment_plan_items()
    render(conn, "index.html", treatment_plan_items: treatment_plan_items)
  end

  def new(conn, _params) do
    changeset = TreatmentPlanItems.change_treatment_plan_item(%TreatmentPlanItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"treatment_plan_item" => treatment_plan_item_params}) do
    case TreatmentPlanItems.create_treatment_plan_item(treatment_plan_item_params) do
      {:ok, treatment_plan_item} ->
        conn
        |> put_flash(:info, "Treatment plan item created successfully.")
        |> redirect(to: Routes.treatment_plan_item_path(conn, :show, treatment_plan_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)
    render(conn, "show.html", treatment_plan_item: treatment_plan_item)
  end

  def edit(conn, %{"id" => id}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)
    changeset = TreatmentPlanItems.change_treatment_plan_item(treatment_plan_item)
    render(conn, "edit.html", treatment_plan_item: treatment_plan_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "treatment_plan_item" => treatment_plan_item_params}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)

    case TreatmentPlanItems.update_treatment_plan_item(treatment_plan_item, treatment_plan_item_params) do
      {:ok, treatment_plan_item} ->
        conn
        |> put_flash(:info, "Treatment plan item updated successfully.")
        |> redirect(to: Routes.treatment_plan_item_path(conn, :show, treatment_plan_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", treatment_plan_item: treatment_plan_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    treatment_plan_item = TreatmentPlanItems.get_treatment_plan_item!(id)
    {:ok, _treatment_plan_item} = TreatmentPlanItems.delete_treatment_plan_item(treatment_plan_item)

    conn
    |> put_flash(:info, "Treatment plan item deleted successfully.")
    |> redirect(to: Routes.treatment_plan_item_path(conn, :index))
  end
end
