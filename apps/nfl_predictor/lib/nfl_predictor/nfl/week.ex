defmodule NflPredictor.Nfl.Week do
  use Ecto.Schema
  import Ecto.Changeset

  alias NflPredictor.Nfl.{Season, Game}


  schema "weeks" do
    field :number, :integer

    belongs_to :seasons, Season, foreign_key: :season_id
    has_many :games, Game

    timestamps()
  end

  @required_fields [:number, :season_id]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(week, attrs) do
    week
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
