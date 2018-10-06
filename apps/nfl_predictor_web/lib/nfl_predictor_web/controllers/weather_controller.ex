defmodule NflPredictorWeb.WeatherController do
  use NflPredictorWeb, :controller

  alias NflPredictor.Nfl
  alias NflPredictor.Nfl.Weather

  action_fallback NflPredictorWeb.FallbackController

  def index(conn, _params) do
    weather = Nfl.list_weather()
    render(conn, "index.json", weather: weather)
  end

  def create(conn, %{"weather" => weather_params}) do
    with {:ok, %Weather{} = weather} <- Nfl.create_weather(weather_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", weather_path(conn, :show, weather))
      |> render("show.json", weather: weather)
    end
  end

  def show(conn, %{"id" => id}) do
    weather = Nfl.get_weather!(id)
    render(conn, "show.json", weather: weather)
  end

  def update(conn, %{"id" => id, "weather" => weather_params}) do
    weather = Nfl.get_weather!(id)

    with {:ok, %Weather{} = weather} <- Nfl.update_weather(weather, weather_params) do
      render(conn, "show.json", weather: weather)
    end
  end

  def delete(conn, %{"id" => id}) do
    weather = Nfl.get_weather!(id)
    with {:ok, %Weather{}} <- Nfl.delete_weather(weather) do
      send_resp(conn, :no_content, "")
    end
  end
end
