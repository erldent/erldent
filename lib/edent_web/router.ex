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
  end

  scope "/api", EdentWeb.Api do
    pipe_through :api
    resources "/doctors", DoctorController
  end


  # Other scopes may use custom stacks.
  # scope "/api", EdentWeb do
  #   pipe_through :api
  # end
end
