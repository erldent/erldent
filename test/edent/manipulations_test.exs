defmodule Edent.ManipulationsTest do
  use Edent.DataCase

  alias Edent.Manipulations

  describe "manipulations" do
    alias Edent.Manipulations.Manipulation

    @valid_attrs %{cost: "120.5", discount_max: "120.5", kind: "some kind", title: "some title"}
    @update_attrs %{cost: "456.7", discount_max: "456.7", kind: "some updated kind", title: "some updated title"}
    @invalid_attrs %{cost: nil, discount_max: nil, kind: nil, title: nil}

    def manipulation_fixture(attrs \\ %{}) do
      {:ok, manipulation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manipulations.create_manipulation()

      manipulation
    end

    test "list_manipulations/0 returns all manipulations" do
      manipulation = manipulation_fixture()
      assert Manipulations.list_manipulations() == [manipulation]
    end

    test "get_manipulation!/1 returns the manipulation with given id" do
      manipulation = manipulation_fixture()
      assert Manipulations.get_manipulation!(manipulation.id) == manipulation
    end

    test "create_manipulation/1 with valid data creates a manipulation" do
      assert {:ok, %Manipulation{} = manipulation} = Manipulations.create_manipulation(@valid_attrs)
      assert manipulation.cost == Decimal.new("120.5")
      assert manipulation.discount_max == Decimal.new("120.5")
      assert manipulation.kind == "some kind"
      assert manipulation.title == "some title"
    end

    test "create_manipulation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manipulations.create_manipulation(@invalid_attrs)
    end

    test "update_manipulation/2 with valid data updates the manipulation" do
      manipulation = manipulation_fixture()
      assert {:ok, %Manipulation{} = manipulation} = Manipulations.update_manipulation(manipulation, @update_attrs)
      assert manipulation.cost == Decimal.new("456.7")
      assert manipulation.discount_max == Decimal.new("456.7")
      assert manipulation.kind == "some updated kind"
      assert manipulation.title == "some updated title"
    end

    test "update_manipulation/2 with invalid data returns error changeset" do
      manipulation = manipulation_fixture()
      assert {:error, %Ecto.Changeset{}} = Manipulations.update_manipulation(manipulation, @invalid_attrs)
      assert manipulation == Manipulations.get_manipulation!(manipulation.id)
    end

    test "delete_manipulation/1 deletes the manipulation" do
      manipulation = manipulation_fixture()
      assert {:ok, %Manipulation{}} = Manipulations.delete_manipulation(manipulation)
      assert_raise Ecto.NoResultsError, fn -> Manipulations.get_manipulation!(manipulation.id) end
    end

    test "change_manipulation/1 returns a manipulation changeset" do
      manipulation = manipulation_fixture()
      assert %Ecto.Changeset{} = Manipulations.change_manipulation(manipulation)
    end
  end
end
