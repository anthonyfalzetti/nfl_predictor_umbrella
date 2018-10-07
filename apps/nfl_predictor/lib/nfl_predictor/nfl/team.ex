defmodule NflPredictor.Nfl.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias NflPredictor.Nfl.{Stadium, Conference, Division}


  schema "teams" do
    field :home_field_advantage, :integer
    field :name, :string
    belongs_to :stadium, Stadium, foreign_key: :stadium_id
    belongs_to :conference, Conference, foreign_key: :conference_id
    belongs_to :division, Division, foreign_key: :division_id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :home_field_advantage])
    |> validate_required([:name, :home_field_advantage])
  end
end
