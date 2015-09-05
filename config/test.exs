use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rocks, Rocks.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :rocks, Rocks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("RDS_USERNAME"),
  password: System.get_env("RDS_PASSWORD"),
  database: System.get_env("RDS_DB_NAME"),
  hostname: System.get_env("RDS_ENDPOINT"),
  pool: Ecto.Adapters.SQL.Sandbox
