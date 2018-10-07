defmodule NflPredictor.Nfl.Conference do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl


  schema "conferences" do
    field :name, :string
    has_many :teams, Nfl.Team

    timestamps()
  end

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
