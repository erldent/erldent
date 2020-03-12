defmodule EdentWeb.Api.DoctorView do
  use EdentWeb, :view
  alias EdentWeb.Api.DoctorView

  def render("index.json", %{doctors: doctors}) do
  %{items: render_many(doctors, DoctorView, "doctor.json")
  }
  end

  def render("show.json", %{doctor: doctor}) do
    %{data: render_one(doctor, DoctorView, "doctor.json")}
  end

  def render("doctor.json", %{doctor: doctor}) do
    %{id: doctor.id,
      fname: doctor.fname,
      pname: doctor.pname,
      lname: doctor.lname,
      text: doctor.lname <> " " <> doctor.fname <> " " <> doctor.pname}
  end
end
