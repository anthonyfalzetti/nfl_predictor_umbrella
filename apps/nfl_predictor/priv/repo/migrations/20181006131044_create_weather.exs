defmodule NflPredictor.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :time, :naive_datetime
      add :temperature, :float
      add :wind_speed, :float
      add :wind_gust, :float
      add :precip_type, :string
      add :visibility, :float
      add :precip_intensity, :float
      add :game_id, references(:games, on_delete: :nothing)

      timestamps()
    end

  end
end
