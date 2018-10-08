defmodule NflPredictor.Seeds.Conferences do
  alias NflPredictor.Nfl.Conference
  alias NflPredictor.Repo

  def seed do
    %Conference{name: "afc"} |> Repo.insert!
    %Conference{name: "nfc"} |> Repo.insert!
  end
end
