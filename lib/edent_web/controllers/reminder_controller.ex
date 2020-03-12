defmodule EdentWeb.ReminderController do
  use EdentWeb, :controller

  alias Edent.Reminders
  alias Edent.Reminders.Reminder

  def index(conn, _params) do
    reminders = Reminders.list_reminders()
    render(conn, "index.html", reminders: reminders)
  end

  def new(conn, _params) do
    changeset = Reminders.change_reminder(%Reminder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reminder" => reminder_params}) do
    case Reminders.create_reminder(reminder_params) do
      {:ok, reminder} ->
        conn
        |> put_flash(:info, "Reminder created successfully.")
        |> redirect(to: Routes.reminder_path(conn, :show, reminder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reminder = Reminders.get_reminder!(id)
    render(conn, "show.html", reminder: reminder)
  end

  def edit(conn, %{"id" => id}) do
    reminder = Reminders.get_reminder!(id)
    changeset = Reminders.change_reminder(reminder)
    render(conn, "edit.html", reminder: reminder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reminder" => reminder_params}) do
    reminder = Reminders.get_reminder!(id)

    case Reminders.update_reminder(reminder, reminder_params) do
      {:ok, reminder} ->
        conn
        |> put_flash(:info, "Reminder updated successfully.")
        |> redirect(to: Routes.reminder_path(conn, :show, reminder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", reminder: reminder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reminder = Reminders.get_reminder!(id)
    {:ok, _reminder} = Reminders.delete_reminder(reminder)

    conn
    |> put_flash(:info, "Reminder deleted successfully.")
    |> redirect(to: Routes.reminder_path(conn, :index))
  end
end
