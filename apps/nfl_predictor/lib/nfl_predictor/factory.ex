defmodule NflPredictor.Factory do
  use ExMachina.Ecto, repo: NflPredictor.Repo
  use Timex
  alias NflPredictor.Nfl.{Conference, Division, Stadium, Team}
  alias NflPredictor.Nfl.{Season, Week, Game, Weather}

  def conference_factory, do: %Conference{ name: "afc" }

  def division_factory, do: %Division{ name: "west" }

  def season_factory, do: %Season{ year: 2008 }

  def week_factory do
    %Week{
      number: 1,
      season_id: build(:season).id
    }
  end

  def team_factory do
    %Team{
      home_field_advantage: 65,
      name: "Denver Broncos",
      stadium_id: build(:stadium).id,
      conference_id: build(:conference).id,
      division_id: build(:division).id
    }
  end

  def stadium_factory do
    %Stadium{
       capacity: 76125,
       city: "Denver",
       elevation: 5280,
       latitude: 39.739663708,
       longitude: -105.018666592,
       name: "Broncos Stadium at Mile High",
       playing_surface: "Kentucky bluegrass",
       roof_type: "Open",
       state: "Colorado"
     }
  end

  def game_factory do
    %Game{
      end_time: ~N[2008-12-28 21:00:00.000000],
      start_time: ~N[2008-12-28 18:00:00.000000],
      home_score: 21,
      away_score: 14,
      home_team_won: true,
      tie: false,
      home_team_id: build(:team).id,
      away_team_id: build(:team).id,
      stadium_id: build(:stadium).id,
      week_id: build(:week).id
    }
  end
end
