defmodule NflPredictor.Nfl.Season do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl.Week


  schema "seasons" do
    field :year, :integer

    has_many :weeks, Week

    timestamps()
  end

  @required_fields [:year]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(season, attrs) do
    season
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
