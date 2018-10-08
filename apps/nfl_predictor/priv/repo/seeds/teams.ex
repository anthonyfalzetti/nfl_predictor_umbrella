defmodule NflPredictor.Seeds.Teams do
  alias NflPredictor.Nfl.{Team, Stadium, Conference, Division}
  alias NflPredictor.Repo

  def seed do
    headers = [:name, :stadium, :conference, :division, :home_field_advantage]
    File.stream!("./priv/repo/seeds/csvs/teams.csv")
    |> CSV.decode!(headers: headers, strip_fields: true)
    |> Enum.each(&(store_team&1))
  end

  defp store_team(row) do
    formatted_row = format_team_row(row)

    Team.changeset(%Team{}, formatted_row)
    |> Repo.insert!
  end

  defp format_team_row(row) do
    %{
      home_field_advantage: to_i(row.home_field_advantage),
      name: row.name,
      stadium_id: Repo.get_by!(Stadium, name: row.stadium).id,
      conference_id: Repo.get_by!(Conference, name: row.conference).id,
      division_id: Repo.get_by!(Division, name: row.division).id
    }
  end

  defp to_i(str), do: String.to_integer(str)
  defp to_f(str), do: String.to_float(str)
end
