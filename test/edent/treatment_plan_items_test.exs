defmodule Edent.TreatmentPlanItemsTest do
  use Edent.DataCase

  alias Edent.TreatmentPlanItems

  describe "treatment_plan_items" do
    alias Edent.TreatmentPlanItems.TreatmentPlanItem

    @valid_attrs %{comments: "some comments", tooth: 42}
    @update_attrs %{comments: "some updated comments", tooth: 43}
    @invalid_attrs %{comments: nil, tooth: nil}

    def treatment_plan_item_fixture(attrs \\ %{}) do
      {:ok, treatment_plan_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TreatmentPlanItems.create_treatment_plan_item()

      treatment_plan_item
    end

    test "list_treatment_plan_items/0 returns all treatment_plan_items" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert TreatmentPlanItems.list_treatment_plan_items() == [treatment_plan_item]
    end

    test "get_treatment_plan_item!/1 returns the treatment_plan_item with given id" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert TreatmentPlanItems.get_treatment_plan_item!(treatment_plan_item.id) == treatment_plan_item
    end

    test "create_treatment_plan_item/1 with valid data creates a treatment_plan_item" do
      assert {:ok, %TreatmentPlanItem{} = treatment_plan_item} = TreatmentPlanItems.create_treatment_plan_item(@valid_attrs)
      assert treatment_plan_item.comments == "some comments"
      assert treatment_plan_item.tooth == 42
    end

    test "create_treatment_plan_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TreatmentPlanItems.create_treatment_plan_item(@invalid_attrs)
    end

    test "update_treatment_plan_item/2 with valid data updates the treatment_plan_item" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert {:ok, %TreatmentPlanItem{} = treatment_plan_item} = TreatmentPlanItems.update_treatment_plan_item(treatment_plan_item, @update_attrs)
      assert treatment_plan_item.comments == "some updated comments"
      assert treatment_plan_item.tooth == 43
    end

    test "update_treatment_plan_item/2 with invalid data returns error changeset" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert {:error, %Ecto.Changeset{}} = TreatmentPlanItems.update_treatment_plan_item(treatment_plan_item, @invalid_attrs)
      assert treatment_plan_item == TreatmentPlanItems.get_treatment_plan_item!(treatment_plan_item.id)
    end

    test "delete_treatment_plan_item/1 deletes the treatment_plan_item" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert {:ok, %TreatmentPlanItem{}} = TreatmentPlanItems.delete_treatment_plan_item(treatment_plan_item)
      assert_raise Ecto.NoResultsError, fn -> TreatmentPlanItems.get_treatment_plan_item!(treatment_plan_item.id) end
    end

    test "change_treatment_plan_item/1 returns a treatment_plan_item changeset" do
      treatment_plan_item = treatment_plan_item_fixture()
      assert %Ecto.Changeset{} = TreatmentPlanItems.change_treatment_plan_item(treatment_plan_item)
    end
  end
end
