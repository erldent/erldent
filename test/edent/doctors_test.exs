defmodule Edent.DoctorsTest do
  use Edent.DataCase

  alias Edent.Doctors

  describe "doctors" do
    alias Edent.Doctors.Doctor

    @valid_attrs %{fname: "some fname", lname: "some lname", pname: "some pname"}
    @update_attrs %{fname: "some updated fname", lname: "some updated lname", pname: "some updated pname"}
    @invalid_attrs %{fname: nil, lname: nil, pname: nil}

    def doctor_fixture(attrs \\ %{}) do
      {:ok, doctor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Doctors.create_doctor()

      doctor
    end

    test "list_doctors/0 returns all doctors" do
      doctor = doctor_fixture()
      assert Doctors.list_doctors() == [doctor]
    end

    test "get_doctor!/1 returns the doctor with given id" do
      doctor = doctor_fixture()
      assert Doctors.get_doctor!(doctor.id) == doctor
    end

    test "create_doctor/1 with valid data creates a doctor" do
      assert {:ok, %Doctor{} = doctor} = Doctors.create_doctor(@valid_attrs)
      assert doctor.fname == "some fname"
      assert doctor.lname == "some lname"
      assert doctor.pname == "some pname"
    end

    test "create_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Doctors.create_doctor(@invalid_attrs)
    end

    test "update_doctor/2 with valid data updates the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{} = doctor} = Doctors.update_doctor(doctor, @update_attrs)
      assert doctor.fname == "some updated fname"
      assert doctor.lname == "some updated lname"
      assert doctor.pname == "some updated pname"
    end

    test "update_doctor/2 with invalid data returns error changeset" do
      doctor = doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = Doctors.update_doctor(doctor, @invalid_attrs)
      assert doctor == Doctors.get_doctor!(doctor.id)
    end

    test "delete_doctor/1 deletes the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{}} = Doctors.delete_doctor(doctor)
      assert_raise Ecto.NoResultsError, fn -> Doctors.get_doctor!(doctor.id) end
    end

    test "change_doctor/1 returns a doctor changeset" do
      doctor = doctor_fixture()
      assert %Ecto.Changeset{} = Doctors.change_doctor(doctor)
    end
  end
end
