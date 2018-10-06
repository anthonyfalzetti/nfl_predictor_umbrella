defmodule NflPredictor.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :home_field_advantage, :integer
      add :stadium_id, references(:stadiums, on_delete: :nothing)
      add :conference_id, references(:conferences, on_delete: :nothing)
      add :division_id, references(:divisions, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:stadium_id])
    create index(:teams, [:conference_id])
    create index(:teams, [:division_id])
  end
end
