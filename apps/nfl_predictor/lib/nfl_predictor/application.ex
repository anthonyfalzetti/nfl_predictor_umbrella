defmodule NflPredictor.Application do
  @moduledoc """
  The NflPredictor Application Service.

  The nfl_predictor system business domain lives in this application.

  Exposes API to clients such as the `NflPredictorWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(NflPredictor.Repo, []),
    ], strategy: :one_for_one, name: NflPredictor.Supervisor)
  end
end
