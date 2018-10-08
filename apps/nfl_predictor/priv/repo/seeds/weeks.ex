defmodule NflPredictor.Seeds.Weeks do
  alias NflPredictor.Nfl.{Week, Season}
  alias NflPredictor.Repo

  def seed do
    Repo.all(Season)
    |> Enum.each(fn(season) ->
      1..21
      |> Enum.each(fn(number) ->
        Week.changeset(%Week{}, %{number: number, season_id: season.id})
        |> Repo.insert!
      end)
    end)
  end
end
