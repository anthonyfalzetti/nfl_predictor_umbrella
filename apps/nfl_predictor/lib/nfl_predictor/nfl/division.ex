defmodule NflPredictor.Nfl.Division do
  use Ecto.Schema
  import Ecto.Changeset


  schema "divisions" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
