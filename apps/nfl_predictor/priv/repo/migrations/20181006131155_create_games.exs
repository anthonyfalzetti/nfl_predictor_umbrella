defmodule NflPredictor.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :stadium_id, references(:stadiums, on_delete: :nothing)
      add :home_team_id, references(:teams, on_delete: :nothing)
      add :away_team_id, references(:teams, on_delete: :nothing)
      add :week_id, references(:weeks, on_delete: :nothing)
      add :home_score, :integer
      add :away_score, :integer
      add :home_team_won, :boolean
      add :tie, :boolean

      timestamps()
    end

    create index(:games, [:stadium_id])
    create index(:games, [:home_team_id])
    create index(:games, [:away_team_id])
    create index(:games, [:week_id])
  end
end
