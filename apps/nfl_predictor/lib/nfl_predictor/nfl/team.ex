defmodule NflPredictor.Nfl.Team do
  use Ecto.Schema
  import Ecto.Changeset


  schema "teams" do
    field :home_field_advantage, :integer
    field :name, :string
    field :stadium_id, :id
    field :conference_id, :id
    field :division_id, :id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :home_field_advantage])
    |> validate_required([:name, :home_field_advantage])
  end
end
