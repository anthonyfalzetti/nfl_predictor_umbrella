defmodule NflPredictorWeb.Router do
  use NflPredictorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NflPredictorWeb do
    pipe_through :api
  end
end
