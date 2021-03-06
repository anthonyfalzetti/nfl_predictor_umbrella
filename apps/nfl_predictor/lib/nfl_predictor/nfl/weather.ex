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

    belongs_to :games, Game, foreign_key: :game_id

    timestamps()
  end

  @required_fields [:time, :temperature, :wind_speed, :wind_gust, :precip_type, :visibility, :precip_intensity, :game_id]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(weather, attrs) do
    weather
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
