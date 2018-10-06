defmodule NflPredictor.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :stadium_id, references(:stadiums, on_delete: :nothing)
      add :home_team_id, references(:games, on_delete: :nothing)
      add :away_team_id, references(:games, on_delete: :nothing)
      add :weather_id, references(:weather, on_delete: :nothing)
      add :week_id, references(:weeks, on_delete: :nothing)

      timestamps()
    end

    create index(:games, [:stadium_id])
    create index(:games, [:home_team_id])
    create index(:games, [:away_team_id])
    create index(:games, [:weather_id])
    create index(:games, [:week_id])
  end
end
