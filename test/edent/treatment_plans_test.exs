defmodule Edent.TreatmentPlansTest do
  use Edent.DataCase

  alias Edent.TreatmentPlans

  describe "treatment_plans" do
    alias Edent.TreatmentPlans.TreatmentPlan

    @valid_attrs %{created: ~N[2010-04-17 14:00:00], finish_schedule: ~N[2010-04-17 14:00:00], isfinished: true}
    @update_attrs %{created: ~N[2011-05-18 15:01:01], finish_schedule: ~N[2011-05-18 15:01:01], isfinished: false}
    @invalid_attrs %{created: nil, finish_schedule: nil, isfinished: nil}

    def treatment_plan_fixture(attrs \\ %{}) do
      {:ok, treatment_plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TreatmentPlans.create_treatment_plan()

      treatment_plan
    end

    test "list_treatment_plans/0 returns all treatment_plans" do
      treatment_plan = treatment_plan_fixture()
      assert TreatmentPlans.list_treatment_plans() == [treatment_plan]
    end

    test "get_treatment_plan!/1 returns the treatment_plan with given id" do
      treatment_plan = treatment_plan_fixture()
      assert TreatmentPlans.get_treatment_plan!(treatment_plan.id) == treatment_plan
    end

    test "create_treatment_plan/1 with valid data creates a treatment_plan" do
      assert {:ok, %TreatmentPlan{} = treatment_plan} = TreatmentPlans.create_treatment_plan(@valid_attrs)
      assert treatment_plan.created == ~N[2010-04-17 14:00:00]
      assert treatment_plan.finish_schedule == ~N[2010-04-17 14:00:00]
      assert treatment_plan.isfinished == true
    end

    test "create_treatment_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TreatmentPlans.create_treatment_plan(@invalid_attrs)
    end

    test "update_treatment_plan/2 with valid data updates the treatment_plan" do
      treatment_plan = treatment_plan_fixture()
      assert {:ok, %TreatmentPlan{} = treatment_plan} = TreatmentPlans.update_treatment_plan(treatment_plan, @update_attrs)
      assert treatment_plan.created == ~N[2011-05-18 15:01:01]
      assert treatment_plan.finish_schedule == ~N[2011-05-18 15:01:01]
      assert treatment_plan.isfinished == false
    end

    test "update_treatment_plan/2 with invalid data returns error changeset" do
      treatment_plan = treatment_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = TreatmentPlans.update_treatment_plan(treatment_plan, @invalid_attrs)
      assert treatment_plan == TreatmentPlans.get_treatment_plan!(treatment_plan.id)
    end

    test "delete_treatment_plan/1 deletes the treatment_plan" do
      treatment_plan = treatment_plan_fixture()
      assert {:ok, %TreatmentPlan{}} = TreatmentPlans.delete_treatment_plan(treatment_plan)
      assert_raise Ecto.NoResultsError, fn -> TreatmentPlans.get_treatment_plan!(treatment_plan.id) end
    end

    test "change_treatment_plan/1 returns a treatment_plan changeset" do
      treatment_plan = treatment_plan_fixture()
      assert %Ecto.Changeset{} = TreatmentPlans.change_treatment_plan(treatment_plan)
    end
  end
end
