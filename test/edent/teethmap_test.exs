defmodule Edent.TeethmapTest do
  use Edent.DataCase

  alias Edent.Teethmap

  describe "teethmap" do
    alias Edent.Teethmap.TeethMapItems

    @valid_attrs %{comments: "some comments", t: ~D[2010-04-17], tooth: 42}
    @update_attrs %{comments: "some updated comments", t: ~D[2011-05-18], tooth: 43}
    @invalid_attrs %{comments: nil, t: nil, tooth: nil}

    def teeth_map_items_fixture(attrs \\ %{}) do
      {:ok, teeth_map_items} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Teethmap.create_teeth_map_items()

      teeth_map_items
    end

    test "list_teethmap/0 returns all teethmap" do
      teeth_map_items = teeth_map_items_fixture()
      assert Teethmap.list_teethmap() == [teeth_map_items]
    end

    test "get_teeth_map_items!/1 returns the teeth_map_items with given id" do
      teeth_map_items = teeth_map_items_fixture()
      assert Teethmap.get_teeth_map_items!(teeth_map_items.id) == teeth_map_items
    end

    test "create_teeth_map_items/1 with valid data creates a teeth_map_items" do
      assert {:ok, %TeethMapItems{} = teeth_map_items} = Teethmap.create_teeth_map_items(@valid_attrs)
      assert teeth_map_items.comments == "some comments"
      assert teeth_map_items.t == ~D[2010-04-17]
      assert teeth_map_items.tooth == 42
    end

    test "create_teeth_map_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teethmap.create_teeth_map_items(@invalid_attrs)
    end

    test "update_teeth_map_items/2 with valid data updates the teeth_map_items" do
      teeth_map_items = teeth_map_items_fixture()
      assert {:ok, %TeethMapItems{} = teeth_map_items} = Teethmap.update_teeth_map_items(teeth_map_items, @update_attrs)
      assert teeth_map_items.comments == "some updated comments"
      assert teeth_map_items.t == ~D[2011-05-18]
      assert teeth_map_items.tooth == 43
    end

    test "update_teeth_map_items/2 with invalid data returns error changeset" do
      teeth_map_items = teeth_map_items_fixture()
      assert {:error, %Ecto.Changeset{}} = Teethmap.update_teeth_map_items(teeth_map_items, @invalid_attrs)
      assert teeth_map_items == Teethmap.get_teeth_map_items!(teeth_map_items.id)
    end

    test "delete_teeth_map_items/1 deletes the teeth_map_items" do
      teeth_map_items = teeth_map_items_fixture()
      assert {:ok, %TeethMapItems{}} = Teethmap.delete_teeth_map_items(teeth_map_items)
      assert_raise Ecto.NoResultsError, fn -> Teethmap.get_teeth_map_items!(teeth_map_items.id) end
    end

    test "change_teeth_map_items/1 returns a teeth_map_items changeset" do
      teeth_map_items = teeth_map_items_fixture()
      assert %Ecto.Changeset{} = Teethmap.change_teeth_map_items(teeth_map_items)
    end
  end
end
