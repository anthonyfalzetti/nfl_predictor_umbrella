defmodule NflPredictor.Seeds do
  alias NflPredictor.Seeds.{Stadiums,Conferences,Divisions,Teams,Seasons,Weeks, Games}

  def seed do
    Stadiums.seed
    Conferences.seed
    Divisions.seed
    Teams.seed
    Seasons.seed
    Weeks.seed
    Games.seed
  end
end

NflPredictor.Seeds.seed
