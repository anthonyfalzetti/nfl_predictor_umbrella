defmodule NflPredictor.Nfl.Week do
  use Ecto.Schema
  import Ecto.Changeset

  alias NflPredictor.Nfl.Season


  schema "weeks" do
    field :number, :integer
    belongs_to :seasons, Season, foreign_key: :season_id

    timestamps()
  end

  @required_fields [:number, :season_id]
  @optional_fields []

  @doc false
  def changeset(week, attrs) do
    week
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
