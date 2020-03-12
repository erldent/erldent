defmodule Edent.VisitExtraDoctorsTest do
  use Edent.DataCase

  alias Edent.VisitExtraDoctors

  describe "visit_extra_doctors" do
    alias Edent.VisitExtraDoctors.VisitExtraDoctor

    @valid_attrs %{comments: "some comments"}
    @update_attrs %{comments: "some updated comments"}
    @invalid_attrs %{comments: nil}

    def visit_extra_doctor_fixture(attrs \\ %{}) do
      {:ok, visit_extra_doctor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VisitExtraDoctors.create_visit_extra_doctor()

      visit_extra_doctor
    end

    test "list_visit_extra_doctors/0 returns all visit_extra_doctors" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert VisitExtraDoctors.list_visit_extra_doctors() == [visit_extra_doctor]
    end

    test "get_visit_extra_doctor!/1 returns the visit_extra_doctor with given id" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert VisitExtraDoctors.get_visit_extra_doctor!(visit_extra_doctor.id) == visit_extra_doctor
    end

    test "create_visit_extra_doctor/1 with valid data creates a visit_extra_doctor" do
      assert {:ok, %VisitExtraDoctor{} = visit_extra_doctor} = VisitExtraDoctors.create_visit_extra_doctor(@valid_attrs)
      assert visit_extra_doctor.comments == "some comments"
    end

    test "create_visit_extra_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VisitExtraDoctors.create_visit_extra_doctor(@invalid_attrs)
    end

    test "update_visit_extra_doctor/2 with valid data updates the visit_extra_doctor" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert {:ok, %VisitExtraDoctor{} = visit_extra_doctor} = VisitExtraDoctors.update_visit_extra_doctor(visit_extra_doctor, @update_attrs)
      assert visit_extra_doctor.comments == "some updated comments"
    end

    test "update_visit_extra_doctor/2 with invalid data returns error changeset" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = VisitExtraDoctors.update_visit_extra_doctor(visit_extra_doctor, @invalid_attrs)
      assert visit_extra_doctor == VisitExtraDoctors.get_visit_extra_doctor!(visit_extra_doctor.id)
    end

    test "delete_visit_extra_doctor/1 deletes the visit_extra_doctor" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert {:ok, %VisitExtraDoctor{}} = VisitExtraDoctors.delete_visit_extra_doctor(visit_extra_doctor)
      assert_raise Ecto.NoResultsError, fn -> VisitExtraDoctors.get_visit_extra_doctor!(visit_extra_doctor.id) end
    end

    test "change_visit_extra_doctor/1 returns a visit_extra_doctor changeset" do
      visit_extra_doctor = visit_extra_doctor_fixture()
      assert %Ecto.Changeset{} = VisitExtraDoctors.change_visit_extra_doctor(visit_extra_doctor)
    end
  end
end
