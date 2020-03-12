defmodule EdentWeb.TreatmentPlanItemControllerTest do
  use EdentWeb.ConnCase

  alias Edent.TreatmentPlanItems

  @create_attrs %{comments: "some comments", tooth: 42}
  @update_attrs %{comments: "some updated comments", tooth: 43}
  @invalid_attrs %{comments: nil, tooth: nil}

  def fixture(:treatment_plan_item) do
    {:ok, treatment_plan_item} = TreatmentPlanItems.create_treatment_plan_item(@create_attrs)
    treatment_plan_item
  end

  describe "index" do
    test "lists all treatment_plan_items", %{conn: conn} do
      conn = get(conn, Routes.treatment_plan_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Treatment plan items"
    end
  end

  describe "new treatment_plan_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.treatment_plan_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Treatment plan item"
    end
  end

  describe "create treatment_plan_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.treatment_plan_item_path(conn, :create), treatment_plan_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.treatment_plan_item_path(conn, :show, id)

      conn = get(conn, Routes.treatment_plan_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Treatment plan item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.treatment_plan_item_path(conn, :create), treatment_plan_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Treatment plan item"
    end
  end

  describe "edit treatment_plan_item" do
    setup [:create_treatment_plan_item]

    test "renders form for editing chosen treatment_plan_item", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = get(conn, Routes.treatment_plan_item_path(conn, :edit, treatment_plan_item))
      assert html_response(conn, 200) =~ "Edit Treatment plan item"
    end
  end

  describe "update treatment_plan_item" do
    setup [:create_treatment_plan_item]

    test "redirects when data is valid", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = put(conn, Routes.treatment_plan_item_path(conn, :update, treatment_plan_item), treatment_plan_item: @update_attrs)
      assert redirected_to(conn) == Routes.treatment_plan_item_path(conn, :show, treatment_plan_item)

      conn = get(conn, Routes.treatment_plan_item_path(conn, :show, treatment_plan_item))
      assert html_response(conn, 200) =~ "some updated comments"
    end

    test "renders errors when data is invalid", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = put(conn, Routes.treatment_plan_item_path(conn, :update, treatment_plan_item), treatment_plan_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Treatment plan item"
    end
  end

  describe "delete treatment_plan_item" do
    setup [:create_treatment_plan_item]

    test "deletes chosen treatment_plan_item", %{conn: conn, treatment_plan_item: treatment_plan_item} do
      conn = delete(conn, Routes.treatment_plan_item_path(conn, :delete, treatment_plan_item))
      assert redirected_to(conn) == Routes.treatment_plan_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.treatment_plan_item_path(conn, :show, treatment_plan_item))
      end
    end
  end

  defp create_treatment_plan_item(_) do
    treatment_plan_item = fixture(:treatment_plan_item)
    {:ok, treatment_plan_item: treatment_plan_item}
  end
end
