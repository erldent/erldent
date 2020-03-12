defmodule EdentWeb.Api.ReminderView do
  use EdentWeb, :view
  alias EdentWeb.Api.ReminderView

  def render("index.json", %{reminders: reminders}) do
    %{data: render_many(reminders, ReminderView, "reminder.json")}
  end

  def render("show.json", %{reminder: reminder}) do
    %{data: render_one(reminder, ReminderView, "reminder.json")}
  end

  def render("reminder.json", %{reminder: reminder}) do
    %{id: reminder.id}
  end
end
