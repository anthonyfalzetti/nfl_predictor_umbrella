defmodule NflPredictor.Nfl.Week do
  use Ecto.Schema
  import Ecto.Changeset


  schema "weeks" do
    field :number, :integer
    field :season_id, :id

    timestamps()
  end

  @doc false
  def changeset(week, attrs) do
    week
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
