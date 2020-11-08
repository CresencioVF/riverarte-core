# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators

config :db,
  ecto_repos: [DB.Repo],
  namespace: DB

config :riverarte_web,
  ecto_repos: [DB.Repo],
  generators: [context_app: :db]

# Configures the endpoint
config :riverarte_web, RiverarteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hu/aX1hfe8k7uWI0j+FAgjEVLP4P7tny1+Y6TRRJ/ZsCMC/JRmUWMOUnfIEuXsdk",
  render_errors: [view: RiverarteWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DB.PubSub,
  live_view: [signing_salt: "p87Nn2HW"]

config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KUqH7uZ3EDCxYaPnBhjFLkksTtBdZiOMdhc0syAW2Ibr4xnyYbzXhZdNy5q0IoZf",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DB.PubSub,
  live_view: [signing_salt: "54nOQwbb"]

config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Po2+qRVtG7hRsMQo+NVKwYtSsYboD0QDxfIpoifh6oPcQH/U/3CI0msJ9frQtmHz",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Admin.PubSub,
  live_view: [signing_salt: "vaTUli9w"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
