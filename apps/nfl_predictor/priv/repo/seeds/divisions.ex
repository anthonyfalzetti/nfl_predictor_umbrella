defmodule NflPredictor.Seeds.Divisions do
  alias NflPredictor.Nfl.Division
  alias NflPredictor.Repo

  def seed do
    %Division{name: "west"} |> Repo.insert!
    %Division{name: "east"} |> Repo.insert!
    %Division{name: "north"} |> Repo.insert!
    %Division{name: "south"} |> Repo.insert!
  end
end
