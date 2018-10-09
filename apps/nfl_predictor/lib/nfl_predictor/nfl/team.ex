defmodule NflPredictor.Nfl.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl.{Stadium, Conference, Division, Game}


  schema "teams" do
    field :home_field_advantage, :integer
    field :name, :string
    belongs_to :stadium, Stadium, foreign_key: :stadium_id
    belongs_to :conference, Conference, foreign_key: :conference_id
    belongs_to :division, Division, foreign_key: :division_id

    has_many :home_team, Game, foreign_key: :home_team_id
    has_many :away_team, Game, foreign_key: :away_team_id

    timestamps()
  end

  @required_fields [:home_field_advantage, :name, :stadium_id, :conference_id, :division_id]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, @total_fields)
    |> validate_required([:name, :home_field_advantage])
  end
end
