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
config :riverarte,
  ecto_repos: [Riverarte.Repo]

config :riverarte_web,
  ecto_repos: [Riverarte.Repo],
  generators: [context_app: :riverarte]

# Configures the endpoint
config :riverarte_web, RiverarteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hu/aX1hfe8k7uWI0j+FAgjEVLP4P7tny1+Y6TRRJ/ZsCMC/JRmUWMOUnfIEuXsdk",
  render_errors: [view: RiverarteWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Riverarte.PubSub,
  live_view: [signing_salt: "p87Nn2HW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
