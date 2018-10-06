use Mix.Config

config :nfl_predictor, ecto_repos: [NflPredictor.Repo]

import_config "#{Mix.env}.exs"
