use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin, AdminWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :admin, Admin.Repo,
  username: "postgres",
  password: "M0bi1e",
  database: "admin_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
