defmodule NflPredictor.Repo.Migrations.CreateStadiums do
  use Ecto.Migration

  def change do
    create table(:stadiums) do
      add :name, :string
      add :capacity, :integer
      add :city, :string
      add :state, :string
      add :playing_surface, :string
      add :roof_type, :string
      add :elevation, :integer
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
