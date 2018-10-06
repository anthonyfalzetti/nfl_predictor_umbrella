defmodule NflPredictor.Repo.Migrations.CreateDivisions do
  use Ecto.Migration

  def change do
    create table(:divisions) do
      add :name, :string

      timestamps()
    end

  end
end
