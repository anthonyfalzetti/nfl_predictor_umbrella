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

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:start_time, :end_time])
    |> validate_required([:start_time, :end_time])
  end
end
