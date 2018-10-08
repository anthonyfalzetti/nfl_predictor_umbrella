defmodule NflPredictor.Seeds do
  alias NflPredictor.Seeds.{Stadiums,Conferences,Divisions,Teams,Seasons,Weeks}

  def seed do
    Stadiums.seed
    Conferences.seed
    Divisions.seed
    Teams.seed
    Seasons.seed
    Weeks.seed
  end
end

NflPredictor.Seeds.seed
