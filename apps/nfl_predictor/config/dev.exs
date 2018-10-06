use Mix.Config

# Configure your database
config :nfl_predictor, NflPredictor.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "nfl_predictor_dev",
  hostname: "localhost",
  pool_size: 10
