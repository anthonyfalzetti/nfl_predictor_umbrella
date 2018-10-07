defmodule NflPredictor.Seeds do
  alias NflPredictor.Nfl.{Stadium, Conference, Division, Team}
  alias NflPredictor.Repo

  def seed do
    seed_stadiums
    seed_confrences
    seed_divisions
    seed_teams
  end

  defp seed_stadiums do
    headers = [ :name, :capacity, :city, :state, :playing_surface, :roof_type, :elevation, :latitude, :longitude ]
    File.stream!("./priv/repo/seeds/csvs/stadiums.csv")
    |> CSV.decode!(headers: headers, strip_fields: true)
    |> Enum.each(&(store_stadium&1))
  end

  defp seed_confrences do
    %Conference{name: "afc"} |> Repo.insert!
    %Conference{name: "nfc"} |> Repo.insert!
  end

  defp seed_divisions do
    %Division{name: "west"} |> Repo.insert!
    %Division{name: "east"} |> Repo.insert!
    %Division{name: "north"} |> Repo.insert!
    %Division{name: "south"} |> Repo.insert!
  end

  defp seed_teams do
    headers = [:name, :stadium, :conference, :division, :home_field_advantage]
    File.stream!("./priv/repo/seeds/csvs/teams.csv")
    |> CSV.decode!(headers: headers, strip_fields: true)
    |> Enum.each(&(store_team&1))
  end

  defp store_stadium(row) do
    formatted_row = format_stadium_row(row)
    Stadium.changeset(%Stadium{}, formatted_row)
    |> Repo.insert!
  end

  defp store_team(row) do
    formatted_row = format_team_row(row)

    Team.changeset(%Team{}, formatted_row)
    |> Repo.insert!
  end

  defp format_stadium_row(row) do
    %{
      capacity: to_i(row.capacity),
      city: row.city,
      elevation: to_i(row.elevation),
      latitude: to_f(row.latitude),
      longitude: to_f(row.longitude),
      name: row.name,
      playing_surface: row.playing_surface,
      roof_type: row.roof_type,
      state: row.state
    }
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

NflPredictor.Seeds.seed
