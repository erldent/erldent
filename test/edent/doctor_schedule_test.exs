defmodule Edent.DoctorScheduleTest do
  use Edent.DataCase

  alias Edent.DoctorSchedule

  describe "doctor_schedule" do
    alias Edent.DoctorSchedule.DoctorScheduleEntry

    @valid_attrs %{d: ~D[2010-04-17], t1: ~T[14:00:00], t2: ~T[14:00:00]}
    @update_attrs %{d: ~D[2011-05-18], t1: ~T[15:01:01], t2: ~T[15:01:01]}
    @invalid_attrs %{d: nil, t1: nil, t2: nil}

    def doctor_schedule_entry_fixture(attrs \\ %{}) do
      {:ok, doctor_schedule_entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DoctorSchedule.create_doctor_schedule_entry()

      doctor_schedule_entry
    end

    test "list_doctor_schedule/0 returns all doctor_schedule" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert DoctorSchedule.list_doctor_schedule() == [doctor_schedule_entry]
    end

    test "get_doctor_schedule_entry!/1 returns the doctor_schedule_entry with given id" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert DoctorSchedule.get_doctor_schedule_entry!(doctor_schedule_entry.id) == doctor_schedule_entry
    end

    test "create_doctor_schedule_entry/1 with valid data creates a doctor_schedule_entry" do
      assert {:ok, %DoctorScheduleEntry{} = doctor_schedule_entry} = DoctorSchedule.create_doctor_schedule_entry(@valid_attrs)
      assert doctor_schedule_entry.d == ~D[2010-04-17]
      assert doctor_schedule_entry.t1 == ~T[14:00:00]
      assert doctor_schedule_entry.t2 == ~T[14:00:00]
    end

    test "create_doctor_schedule_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DoctorSchedule.create_doctor_schedule_entry(@invalid_attrs)
    end

    test "update_doctor_schedule_entry/2 with valid data updates the doctor_schedule_entry" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert {:ok, %DoctorScheduleEntry{} = doctor_schedule_entry} = DoctorSchedule.update_doctor_schedule_entry(doctor_schedule_entry, @update_attrs)
      assert doctor_schedule_entry.d == ~D[2011-05-18]
      assert doctor_schedule_entry.t1 == ~T[15:01:01]
      assert doctor_schedule_entry.t2 == ~T[15:01:01]
    end

    test "update_doctor_schedule_entry/2 with invalid data returns error changeset" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = DoctorSchedule.update_doctor_schedule_entry(doctor_schedule_entry, @invalid_attrs)
      assert doctor_schedule_entry == DoctorSchedule.get_doctor_schedule_entry!(doctor_schedule_entry.id)
    end

    test "delete_doctor_schedule_entry/1 deletes the doctor_schedule_entry" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert {:ok, %DoctorScheduleEntry{}} = DoctorSchedule.delete_doctor_schedule_entry(doctor_schedule_entry)
      assert_raise Ecto.NoResultsError, fn -> DoctorSchedule.get_doctor_schedule_entry!(doctor_schedule_entry.id) end
    end

    test "change_doctor_schedule_entry/1 returns a doctor_schedule_entry changeset" do
      doctor_schedule_entry = doctor_schedule_entry_fixture()
      assert %Ecto.Changeset{} = DoctorSchedule.change_doctor_schedule_entry(doctor_schedule_entry)
    end
  end
end
