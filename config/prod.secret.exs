use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :gamlastansmetet, Gamlastansmetet.Endpoint,
  secret_key_base: "bVcdPsd2FzOp19AXdoKC9WnUsZAoXo5bjIUBo4bJGB2nbsDGQ+J6fXmrNLroOlXi"

# Configure your database
config :gamlastansmetet, Gamlastansmetet.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gamlastansmetet_prod"
