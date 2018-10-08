defmodule NflPredictor.Nfl.Game do
  use Ecto.Schema
  import Ecto.Changeset


  schema "games" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    field :stadium_id, :id
    field :home_team_id, :id
    field :away_team_id, :id
    field :weather_id, :id
    field :week_id, :id

    timestamps()
  end

  @required_fields [:end_time, :start_time, :stadium_id, :home_team_id, :away_team_id, :week_id]
  @optional_fields [:weather_id]

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
