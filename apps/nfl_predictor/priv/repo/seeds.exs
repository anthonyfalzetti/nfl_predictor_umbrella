defmodule NflPredictor.Seeds.Stadiums do
  alias NflPredictor.Nfl.Stadium
  alias NflPredictor.Repo

  def seed do
    headers = [ :name, :capacity, :city, :state, :playing_surface, :roof_type, :elevation, :latitude, :longitude ]
    File.stream!("./priv/repo/seeds/csvs/stadiums.csv")
    |> CSV.decode!(headers: headers, strip_fields: true)
    |> Enum.each(&(store_stadium&1))
  end

  def store_stadium(row) do
    formatted_row = format_row(row)
    Stadium.changeset(%Stadium{}, formatted_row)
    |> Repo.insert!(cs)
  end

  defp format_row(row) do
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

  defp to_i(str), do: String.to_integer(str)
  defp to_f(str), do: String.to_float(str)
end

NflPredictor.Seeds.Stadiums.seed
