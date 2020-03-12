defmodule Edent.VisitManipulationsTest do
  use Edent.DataCase

  alias Edent.VisitManipulations

  describe "visit_manipulations" do
    alias Edent.VisitManipulations.VisitManipulation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def visit_manipulation_fixture(attrs \\ %{}) do
      {:ok, visit_manipulation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VisitManipulations.create_visit_manipulation()

      visit_manipulation
    end

    test "list_visit_manipulations/0 returns all visit_manipulations" do
      visit_manipulation = visit_manipulation_fixture()
      assert VisitManipulations.list_visit_manipulations() == [visit_manipulation]
    end

    test "get_visit_manipulation!/1 returns the visit_manipulation with given id" do
      visit_manipulation = visit_manipulation_fixture()
      assert VisitManipulations.get_visit_manipulation!(visit_manipulation.id) == visit_manipulation
    end

    test "create_visit_manipulation/1 with valid data creates a visit_manipulation" do
      assert {:ok, %VisitManipulation{} = visit_manipulation} = VisitManipulations.create_visit_manipulation(@valid_attrs)
    end

    test "create_visit_manipulation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VisitManipulations.create_visit_manipulation(@invalid_attrs)
    end

    test "update_visit_manipulation/2 with valid data updates the visit_manipulation" do
      visit_manipulation = visit_manipulation_fixture()
      assert {:ok, %VisitManipulation{} = visit_manipulation} = VisitManipulations.update_visit_manipulation(visit_manipulation, @update_attrs)
    end

    test "update_visit_manipulation/2 with invalid data returns error changeset" do
      visit_manipulation = visit_manipulation_fixture()
      assert {:error, %Ecto.Changeset{}} = VisitManipulations.update_visit_manipulation(visit_manipulation, @invalid_attrs)
      assert visit_manipulation == VisitManipulations.get_visit_manipulation!(visit_manipulation.id)
    end

    test "delete_visit_manipulation/1 deletes the visit_manipulation" do
      visit_manipulation = visit_manipulation_fixture()
      assert {:ok, %VisitManipulation{}} = VisitManipulations.delete_visit_manipulation(visit_manipulation)
      assert_raise Ecto.NoResultsError, fn -> VisitManipulations.get_visit_manipulation!(visit_manipulation.id) end
    end

    test "change_visit_manipulation/1 returns a visit_manipulation changeset" do
      visit_manipulation = visit_manipulation_fixture()
      assert %Ecto.Changeset{} = VisitManipulations.change_visit_manipulation(visit_manipulation)
    end
  end
end
