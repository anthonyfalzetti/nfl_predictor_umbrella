defmodule NflPredictor.Nfl.Weather do
  use Ecto.Schema
  import Ecto.Changeset


  schema "weather" do
    field :precip_intensity, :float
    field :precip_type, :string
    field :temperature, :float
    field :time, :naive_datetime
    field :visibility, :float
    field :wind_gust, :float
    field :wind_speed, :float

    timestamps()
  end

  @doc false
  def changeset(weather, attrs) do
    weather
    |> cast(attrs, [:time, :temperature, :wind_speed, :wind_gust, :precip_type, :visibility, :precip_intensity])
    |> validate_required([:time, :temperature, :wind_speed, :wind_gust, :precip_type, :visibility, :precip_intensity])
  end
end
