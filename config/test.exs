use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gamlastansmetet, Gamlastansmetet.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :gamlastansmetet, Gamlastansmetet.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "gamlastansmetet_test",
  size: 1,
  max_overflow: false

# Configure Hound
config :hound,
  driver: "selenium",
  port: 4444
