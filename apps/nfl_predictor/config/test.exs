use Mix.Config

# Configure your database
config :nfl_predictor, NflPredictor.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "nfl_predictor_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
