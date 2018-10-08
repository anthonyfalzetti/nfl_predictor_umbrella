defmodule NflPredictor.Nfl.Conference do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl


  schema "conferences" do
    field :name, :string
    has_many :teams, Nfl.Team

    timestamps()
  end
  @required_fields [:name]
  @optional_fields []

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
