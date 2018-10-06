defmodule NflPredictor.Nfl.Stadium do
  use Ecto.Schema
  import Ecto.Changeset


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

    timestamps()
  end

  @doc false
  def changeset(stadium, attrs) do
    stadium
    |> cast(attrs, [:name, :capacity, :city, :state, :playing_surface, :roof_type, :elevation, :latitude, :longitude])
    |> validate_required([:name, :capacity, :city, :state, :playing_surface, :roof_type, :elevation, :latitude, :longitude])
  end
end
