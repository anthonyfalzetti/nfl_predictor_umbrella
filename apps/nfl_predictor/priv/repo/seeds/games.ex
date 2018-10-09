defmodule NflPredictor.Seeds.Games do
  use Timex
  alias NflPredictor.Nfl.{Game, Team, Season}
  alias NflPredictor.Repo
  import Ecto.Query

  def seed do
    headers = [:week_id, :start_time, :home_team_name, :away_team_name, :home_team_score, :away_team_score]

    find_seed_files()
    |> Enum.each(fn(file) ->
      File.stream!("./priv/repo/seeds/csvs/games/#{file}")
      |> CSV.decode!(headers: headers, strip_fields: true)
      |> Enum.each(fn(row) ->
        store_game(row, file)
      end)
    end)
  end

  defp find_seed_files, do: File.ls!("./priv/repo/seeds/csvs/games/")

  defp store_game(row, file_name) do
    formatted_row = format_game_row(row, file_name)
    Game.changeset(%Game{}, formatted_row)
    |> Repo.insert!
  end

  defp format_game_row(row, file_name) do
    start_time = parse_start_time(row)
    home_team = parse_home_team(row)

    %{
      start_time: start_time,
      end_time: end_time(start_time),
      stadium_id: home_team.stadium_id,
      home_team_id: home_team.id,
      away_team_id: away_team(row).id,
      home_score: home_score(row),
      away_score: away_score(row),
      week_id: week(row, file_name),
      home_team_won: home_team_won(row),
      tie: tie(row)
    }
  end

  defp parse_start_time(%{start_time: start_time}) do
    start_time <> " MDT"
    |> Timex.parse!("{Mshort} {D} {YYYY} {h24}:{m} {AM} {Zabbr}")
    |> Timex.Timezone.convert("UTC")
  end
  defp end_time(start_time), do: Timex.shift(start_time, hours: 3)

  defp parse_home_team(%{home_team_name: home_team}), do: find_team(home_team)
  defp away_team(%{away_team_name: away_team}), do: find_team(away_team)
  defp find_team(team_name), do: Repo.get_by!(Team, name: team_name)

  defp week(%{week_id: week_id}, file_name) do
    yid = year_id(file_name)
    number = to_i(week_id)
    Repo.one(from w in "weeks",
             where: w.season_id == ^yid and w.number == ^number,
             select: w.id)
  end

  defp year_id(file_name) do
    year = parse_year(file_name)
    Repo.get_by!(Season, year: year).id
  end

  defp parse_year(file_name) do
    String.split(file_name, ".", parts: 2)
    |> List.first
    |> to_i
  end

  defp home_score(%{home_team_score: score}), do: to_i(score)
  defp away_score(%{away_team_score: score}), do: to_i(score)

  defp home_team_won(%{home_team_score: home_score, away_team_score: away_score}) do
    to_i(home_score) > to_i(away_score)
  end

  defp tie(%{home_team_score: home_score, away_team_score: away_score}) do
    to_i(home_score) == to_i(away_score)
  end

  defp to_i(str), do: String.to_integer(str)
end
