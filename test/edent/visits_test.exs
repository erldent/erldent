defmodule Edent.VisitsTest do
  use Edent.DataCase

  alias Edent.Visits

  describe "visits" do
    alias Edent.Visits.Visit

    @valid_attrs %{cancelled: true, comments: "some comments", complains: "some complains", duration: ~T[14:00:00], recommndations: "some recommndations", t: ~N[2010-04-17 14:00:00]}
    @update_attrs %{cancelled: false, comments: "some updated comments", complains: "some updated complains", duration: ~T[15:01:01], recommndations: "some updated recommndations", t: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{cancelled: nil, comments: nil, complains: nil, duration: nil, recommndations: nil, t: nil}

    def visit_fixture(attrs \\ %{}) do
      {:ok, visit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Visits.create_visit()

      visit
    end

    test "list_visits/0 returns all visits" do
      visit = visit_fixture()
      assert Visits.list_visits() == [visit]
    end

    test "get_visit!/1 returns the visit with given id" do
      visit = visit_fixture()
      assert Visits.get_visit!(visit.id) == visit
    end

    test "create_visit/1 with valid data creates a visit" do
      assert {:ok, %Visit{} = visit} = Visits.create_visit(@valid_attrs)
      assert visit.cancelled == true
      assert visit.comments == "some comments"
      assert visit.complains == "some complains"
      assert visit.duration == ~T[14:00:00]
      assert visit.recommndations == "some recommndations"
      assert visit.t == ~N[2010-04-17 14:00:00]
    end

    test "create_visit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Visits.create_visit(@invalid_attrs)
    end

    test "update_visit/2 with valid data updates the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{} = visit} = Visits.update_visit(visit, @update_attrs)
      assert visit.cancelled == false
      assert visit.comments == "some updated comments"
      assert visit.complains == "some updated complains"
      assert visit.duration == ~T[15:01:01]
      assert visit.recommndations == "some updated recommndations"
      assert visit.t == ~N[2011-05-18 15:01:01]
    end

    test "update_visit/2 with invalid data returns error changeset" do
      visit = visit_fixture()
      assert {:error, %Ecto.Changeset{}} = Visits.update_visit(visit, @invalid_attrs)
      assert visit == Visits.get_visit!(visit.id)
    end

    test "delete_visit/1 deletes the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{}} = Visits.delete_visit(visit)
      assert_raise Ecto.NoResultsError, fn -> Visits.get_visit!(visit.id) end
    end

    test "change_visit/1 returns a visit changeset" do
      visit = visit_fixture()
      assert %Ecto.Changeset{} = Visits.change_visit(visit)
    end
  end
end
