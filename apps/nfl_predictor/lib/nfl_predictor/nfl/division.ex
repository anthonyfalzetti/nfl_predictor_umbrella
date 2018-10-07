defmodule NflPredictor.Nfl.Division do
  use Ecto.Schema
  import Ecto.Changeset

  alias NflPredictor.Nfl


  schema "divisions" do
    field :name, :string
    has_many :teams, Nfl.Team

    timestamps()
  end

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
