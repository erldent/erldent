defmodule Edent.RemindersTest do
  use Edent.DataCase

  alias Edent.Reminders

  describe "reminders" do
    alias Edent.Reminders.Reminder

    @valid_attrs %{auto: true, comments: "some comments", t: ~N[2010-04-17 14:00:00], text: "some text"}
    @update_attrs %{auto: false, comments: "some updated comments", t: ~N[2011-05-18 15:01:01], text: "some updated text"}
    @invalid_attrs %{auto: nil, comments: nil, t: nil, text: nil}

    def reminder_fixture(attrs \\ %{}) do
      {:ok, reminder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reminders.create_reminder()

      reminder
    end

    test "list_reminders/0 returns all reminders" do
      reminder = reminder_fixture()
      assert Reminders.list_reminders() == [reminder]
    end

    test "get_reminder!/1 returns the reminder with given id" do
      reminder = reminder_fixture()
      assert Reminders.get_reminder!(reminder.id) == reminder
    end

    test "create_reminder/1 with valid data creates a reminder" do
      assert {:ok, %Reminder{} = reminder} = Reminders.create_reminder(@valid_attrs)
      assert reminder.auto == true
      assert reminder.comments == "some comments"
      assert reminder.t == ~N[2010-04-17 14:00:00]
      assert reminder.text == "some text"
    end

    test "create_reminder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reminders.create_reminder(@invalid_attrs)
    end

    test "update_reminder/2 with valid data updates the reminder" do
      reminder = reminder_fixture()
      assert {:ok, %Reminder{} = reminder} = Reminders.update_reminder(reminder, @update_attrs)
      assert reminder.auto == false
      assert reminder.comments == "some updated comments"
      assert reminder.t == ~N[2011-05-18 15:01:01]
      assert reminder.text == "some updated text"
    end

    test "update_reminder/2 with invalid data returns error changeset" do
      reminder = reminder_fixture()
      assert {:error, %Ecto.Changeset{}} = Reminders.update_reminder(reminder, @invalid_attrs)
      assert reminder == Reminders.get_reminder!(reminder.id)
    end

    test "delete_reminder/1 deletes the reminder" do
      reminder = reminder_fixture()
      assert {:ok, %Reminder{}} = Reminders.delete_reminder(reminder)
      assert_raise Ecto.NoResultsError, fn -> Reminders.get_reminder!(reminder.id) end
    end

    test "change_reminder/1 returns a reminder changeset" do
      reminder = reminder_fixture()
      assert %Ecto.Changeset{} = Reminders.change_reminder(reminder)
    end
  end
end
