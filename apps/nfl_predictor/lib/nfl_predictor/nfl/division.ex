defmodule NflPredictor.Nfl.Division do
  use Ecto.Schema
  import Ecto.Changeset

  alias NflPredictor.Nfl


  schema "divisions" do
    field :name, :string

    has_many :teams, Nfl.Team

    timestamps()
  end

  @required_fields [:name]
  @optional_fields []
  @total_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, @total_fields)
    |> validate_required(@required_fields)
  end
end
