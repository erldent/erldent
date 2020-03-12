defmodule EdentWeb.Api.VisitExtraDoctorView do
  use EdentWeb, :view
  alias EdentWeb.Api.VisitExtraDoctorView

  def render("index.json", %{visit_extra_doctors: visit_extra_doctors}) do
    %{data: render_many(visit_extra_doctors, VisitExtraDoctorView, "visit_extra_doctor.json")}
  end

  def render("show.json", %{visit_extra_doctor: visit_extra_doctor}) do
    %{data: render_one(visit_extra_doctor, VisitExtraDoctorView, "visit_extra_doctor.json")}
  end

  def render("visit_extra_doctor.json", %{visit_extra_doctor: visit_extra_doctor}) do
    %{id: visit_extra_doctor.id}
  end
end
