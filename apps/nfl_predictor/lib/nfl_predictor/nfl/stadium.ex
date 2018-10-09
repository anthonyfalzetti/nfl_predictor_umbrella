defmodule NflPredictor.Nfl.Stadium do
  use Ecto.Schema
  import Ecto.Changeset

  alias NflPredictor.Nfl


  schema "stadiums" do
    field :capacity, :integer
    field :city, :string
    field :elevation, :integer
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :playing_surface, :string
    field :roof_type, :string
    field :state, :string

    has_many :teams, Nfl.Team
    has_many :games, Nfl.Game

    timestamps()
  end

  @required_fields [:name, :capacity, :city, :state, :playing_surface, :roof_type, :elevation, :latitude, :longitude]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(stadium, attrs) do
    stadium
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
