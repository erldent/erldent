defmodule Edent.Repo do
  use Ecto.Repo,
    otp_app: :edent,
    adapter: Ecto.Adapters.Postgres
end
