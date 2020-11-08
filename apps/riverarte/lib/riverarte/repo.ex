defmodule Riverarte.Repo do
  use Ecto.Repo,
    otp_app: :riverarte,
    adapter: Ecto.Adapters.Postgres
end
