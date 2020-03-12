defmodule EdentWeb.Router do
  use EdentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EdentWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/doctors", DoctorController
    resources "/doctor_schedule", DoctorScheduleEntryController
    resources "/patients", PatientController
    resources "/visits", VisitController
    resources "/manipulations", ManipulationController
    resources "/visit_manipulations", VisitManipulationController
    resources "/visit_extra_doctors", VisitExtraDoctorController
    resources "/treatment_plans", TreatmentPlanController
    resources "/teethmap", TeethMapItemsController
    resources "/photos", PhotoController
    resources "/reminders", ReminderController
  end

  scope "/api", EdentWeb.Api do
    pipe_through :api
    resources "/doctors", DoctorController
    resources "/manipulations", ManipulationController
    resources "/treatment_plans", TreatmentPlanController
    resources "/visit_manipulations", VisitManipulationController
    resources "/teethmap", TeethMapItemsController
    resources "/treatment_plans", TreatmentPlanController
    resources "/treatment_plan_items", TreatmentPlanItemController
    resources "/visit_extra_doctors", VisitExtraDoctorController
    resources "/photos", PhotoController
    resources "/reminders", ReminderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EdentWeb do
  #   pipe_through :api
  # end
end
