defmodule Edent.PatientsTest do
  use Edent.DataCase

  alias Edent.Patients

  describe "patients" do
    alias Edent.Patients.Patient

    @valid_attrs %{birthday: ~D[2010-04-17], discount: "120.5", fname: "some fname", phone_extra: "some phone_extra", phone_pri: "some phone_pri", phone_sms: "some phone_sms", pname: "some pname", sname: "some sname", source: "some source"}
    @update_attrs %{birthday: ~D[2011-05-18], discount: "456.7", fname: "some updated fname", phone_extra: "some updated phone_extra", phone_pri: "some updated phone_pri", phone_sms: "some updated phone_sms", pname: "some updated pname", sname: "some updated sname", source: "some updated source"}
    @invalid_attrs %{birthday: nil, discount: nil, fname: nil, phone_extra: nil, phone_pri: nil, phone_sms: nil, pname: nil, sname: nil, source: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Patients.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Patients.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Patients.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Patients.create_patient(@valid_attrs)
      assert patient.birthday == ~D[2010-04-17]
      assert patient.discount == Decimal.new("120.5")
      assert patient.fname == "some fname"
      assert patient.phone_extra == "some phone_extra"
      assert patient.phone_pri == "some phone_pri"
      assert patient.phone_sms == "some phone_sms"
      assert patient.pname == "some pname"
      assert patient.sname == "some sname"
      assert patient.source == "some source"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patients.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Patients.update_patient(patient, @update_attrs)
      assert patient.birthday == ~D[2011-05-18]
      assert patient.discount == Decimal.new("456.7")
      assert patient.fname == "some updated fname"
      assert patient.phone_extra == "some updated phone_extra"
      assert patient.phone_pri == "some updated phone_pri"
      assert patient.phone_sms == "some updated phone_sms"
      assert patient.pname == "some updated pname"
      assert patient.sname == "some updated sname"
      assert patient.source == "some updated source"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Patients.update_patient(patient, @invalid_attrs)
      assert patient == Patients.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Patients.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Patients.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Patients.change_patient(patient)
    end
  end
end
