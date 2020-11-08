use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :db, DB.Repo,
  username: "steeve",
  password: "Mishibebe69",
  database: "riverarte_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :riverarte_web, RiverarteWeb.Endpoint,
  http: [port: 4005],
  server: false

config :api, ApiWeb.Endpoint,
  http: [port: 4006],
  server: false

config :admin, AdminWeb.Endpoint,
  http: [port: 4007],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
