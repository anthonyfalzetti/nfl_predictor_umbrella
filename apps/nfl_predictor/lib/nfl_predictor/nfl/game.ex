defmodule NflPredictor.Nfl.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl.{Team, Stadium, Week}

  schema "games" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    field :home_score, :integer
    field :away_score, :integer
    field :home_team_won, :boolean
    field :tie, :boolean

    belongs_to :home_team, Team, foreign_key: :home_team_id
    belongs_to :away_team, Team, foreign_key: :away_team_id
    belongs_to :stadiums, Stadium, foreign_key: :stadium_id
    belongs_to :weeks, Week, foreign_key: :week_id

    timestamps()
  end

  @required_fields [:end_time, :start_time, :stadium_id, :home_team_id, :away_team_id, :week_id]
  @optional_fields [:home_score, :away_score, :home_team_won, :tie]
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
