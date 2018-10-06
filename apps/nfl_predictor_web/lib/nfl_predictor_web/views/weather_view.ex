defmodule NflPredictorWeb.WeatherView do
  use NflPredictorWeb, :view
  alias NflPredictorWeb.WeatherView

  def render("index.json", %{weather: weather}) do
    %{data: render_many(weather, WeatherView, "weather.json")}
  end

  def render("show.json", %{weather: weather}) do
    %{data: render_one(weather, WeatherView, "weather.json")}
  end

  def render("weather.json", %{weather: weather}) do
    %{id: weather.id,
      time: weather.time,
      temperature: weather.temperature,
      wind_speed: weather.wind_speed,
      wind_gust: weather.wind_gust,
      precip_type: weather.precip_type,
      visibility: weather.visibility,
      precip_intensity: weather.precip_intensity}
  end
end
