defmodule NflPredictor.Nfl do
  @moduledoc """
  The Nfl context.
  """

  import Ecto.Query, warn: false
  alias NflPredictor.Repo

  alias NflPredictor.Nfl.Stadium

  @doc """
  Returns the list of stadiums.

  ## Examples

      iex> list_stadiums()
      [%Stadium{}, ...]

  """
  def list_stadiums do
    Repo.all(Stadium)
  end

  @doc """
  Gets a single stadium.

  Raises `Ecto.NoResultsError` if the Stadium does not exist.

  ## Examples

      iex> get_stadium!(123)
      %Stadium{}

      iex> get_stadium!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stadium!(id), do: Repo.get!(Stadium, id)

  @doc """
  Creates a stadium.

  ## Examples

      iex> create_stadium(%{field: value})
      {:ok, %Stadium{}}

      iex> create_stadium(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stadium(attrs \\ %{}) do
    %Stadium{}
    |> Stadium.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stadium.

  ## Examples

      iex> update_stadium(stadium, %{field: new_value})
      {:ok, %Stadium{}}

      iex> update_stadium(stadium, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stadium(%Stadium{} = stadium, attrs) do
    stadium
    |> Stadium.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Stadium.

  ## Examples

      iex> delete_stadium(stadium)
      {:ok, %Stadium{}}

      iex> delete_stadium(stadium)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stadium(%Stadium{} = stadium) do
    Repo.delete(stadium)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stadium changes.

  ## Examples

      iex> change_stadium(stadium)
      %Ecto.Changeset{source: %Stadium{}}

  """
  def change_stadium(%Stadium{} = stadium) do
    Stadium.changeset(stadium, %{})
  end

  alias NflPredictor.Nfl.Conference

  @doc """
  Returns the list of conferences.

  ## Examples

      iex> list_conferences()
      [%Conference{}, ...]

  """
  def list_conferences do
    Repo.all(Conference)
  end

  @doc """
  Gets a single conference.

  Raises `Ecto.NoResultsError` if the Conference does not exist.

  ## Examples

      iex> get_conference!(123)
      %Conference{}

      iex> get_conference!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conference!(id), do: Repo.get!(Conference, id)

  @doc """
  Creates a conference.

  ## Examples

      iex> create_conference(%{field: value})
      {:ok, %Conference{}}

      iex> create_conference(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conference(attrs \\ %{}) do
    %Conference{}
    |> Conference.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conference.

  ## Examples

      iex> update_conference(conference, %{field: new_value})
      {:ok, %Conference{}}

      iex> update_conference(conference, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conference(%Conference{} = conference, attrs) do
    conference
    |> Conference.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Conference.

  ## Examples

      iex> delete_conference(conference)
      {:ok, %Conference{}}

      iex> delete_conference(conference)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conference(%Conference{} = conference) do
    Repo.delete(conference)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conference changes.

  ## Examples

      iex> change_conference(conference)
      %Ecto.Changeset{source: %Conference{}}

  """
  def change_conference(%Conference{} = conference) do
    Conference.changeset(conference, %{})
  end

  alias NflPredictor.Nfl.Division

  @doc """
  Returns the list of divisions.

  ## Examples

      iex> list_divisions()
      [%Division{}, ...]

  """
  def list_divisions do
    Repo.all(Division)
  end

  @doc """
  Gets a single division.

  Raises `Ecto.NoResultsError` if the Division does not exist.

  ## Examples

      iex> get_division!(123)
      %Division{}

      iex> get_division!(456)
      ** (Ecto.NoResultsError)

  """
  def get_division!(id), do: Repo.get!(Division, id)

  @doc """
  Creates a division.

  ## Examples

      iex> create_division(%{field: value})
      {:ok, %Division{}}

      iex> create_division(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_division(attrs \\ %{}) do
    %Division{}
    |> Division.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a division.

  ## Examples

      iex> update_division(division, %{field: new_value})
      {:ok, %Division{}}

      iex> update_division(division, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_division(%Division{} = division, attrs) do
    division
    |> Division.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Division.

  ## Examples

      iex> delete_division(division)
      {:ok, %Division{}}

      iex> delete_division(division)
      {:error, %Ecto.Changeset{}}

  """
  def delete_division(%Division{} = division) do
    Repo.delete(division)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking division changes.

  ## Examples

      iex> change_division(division)
      %Ecto.Changeset{source: %Division{}}

  """
  def change_division(%Division{} = division) do
    Division.changeset(division, %{})
  end

  alias NflPredictor.Nfl.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{source: %Team{}}

  """
  def change_team(%Team{} = team) do
    Team.changeset(team, %{})
  end

  alias NflPredictor.Nfl.Season

  @doc """
  Returns the list of seasons.

  ## Examples

      iex> list_seasons()
      [%Season{}, ...]

  """
  def list_seasons do
    Repo.all(Season)
  end

  @doc """
  Gets a single season.

  Raises `Ecto.NoResultsError` if the Season does not exist.

  ## Examples

      iex> get_season!(123)
      %Season{}

      iex> get_season!(456)
      ** (Ecto.NoResultsError)

  """
  def get_season!(id), do: Repo.get!(Season, id)

  @doc """
  Creates a season.

  ## Examples

      iex> create_season(%{field: value})
      {:ok, %Season{}}

      iex> create_season(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_season(attrs \\ %{}) do
    %Season{}
    |> Season.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a season.

  ## Examples

      iex> update_season(season, %{field: new_value})
      {:ok, %Season{}}

      iex> update_season(season, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_season(%Season{} = season, attrs) do
    season
    |> Season.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Season.

  ## Examples

      iex> delete_season(season)
      {:ok, %Season{}}

      iex> delete_season(season)
      {:error, %Ecto.Changeset{}}

  """
  def delete_season(%Season{} = season) do
    Repo.delete(season)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking season changes.

  ## Examples

      iex> change_season(season)
      %Ecto.Changeset{source: %Season{}}

  """
  def change_season(%Season{} = season) do
    Season.changeset(season, %{})
  end

  alias NflPredictor.Nfl.Week

  @doc """
  Returns the list of weeks.

  ## Examples

      iex> list_weeks()
      [%Week{}, ...]

  """
  def list_weeks do
    Repo.all(Week)
  end

  @doc """
  Gets a single week.

  Raises `Ecto.NoResultsError` if the Week does not exist.

  ## Examples

      iex> get_week!(123)
      %Week{}

      iex> get_week!(456)
      ** (Ecto.NoResultsError)

  """
  def get_week!(id), do: Repo.get!(Week, id)

  @doc """
  Creates a week.

  ## Examples

      iex> create_week(%{field: value})
      {:ok, %Week{}}

      iex> create_week(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_week(attrs \\ %{}) do
    %Week{}
    |> Week.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a week.

  ## Examples

      iex> update_week(week, %{field: new_value})
      {:ok, %Week{}}

      iex> update_week(week, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_week(%Week{} = week, attrs) do
    week
    |> Week.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Week.

  ## Examples

      iex> delete_week(week)
      {:ok, %Week{}}

      iex> delete_week(week)
      {:error, %Ecto.Changeset{}}

  """
  def delete_week(%Week{} = week) do
    Repo.delete(week)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking week changes.

  ## Examples

      iex> change_week(week)
      %Ecto.Changeset{source: %Week{}}

  """
  def change_week(%Week{} = week) do
    Week.changeset(week, %{})
  end

  alias NflPredictor.Nfl.Weather

  @doc """
  Returns the list of weather.

  ## Examples

      iex> list_weather()
      [%Weather{}, ...]

  """
  def list_weather do
    Repo.all(Weather)
  end

  @doc """
  Gets a single weather.

  Raises `Ecto.NoResultsError` if the Weather does not exist.

  ## Examples

      iex> get_weather!(123)
      %Weather{}

      iex> get_weather!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weather!(id), do: Repo.get!(Weather, id)

  @doc """
  Creates a weather.

  ## Examples

      iex> create_weather(%{field: value})
      {:ok, %Weather{}}

      iex> create_weather(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weather(attrs \\ %{}) do
    %Weather{}
    |> Weather.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weather.

  ## Examples

      iex> update_weather(weather, %{field: new_value})
      {:ok, %Weather{}}

      iex> update_weather(weather, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weather(%Weather{} = weather, attrs) do
    weather
    |> Weather.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Weather.

  ## Examples

      iex> delete_weather(weather)
      {:ok, %Weather{}}

      iex> delete_weather(weather)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weather(%Weather{} = weather) do
    Repo.delete(weather)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weather changes.

  ## Examples

      iex> change_weather(weather)
      %Ecto.Changeset{source: %Weather{}}

  """
  def change_weather(%Weather{} = weather) do
    Weather.changeset(weather, %{})
  end

  alias NflPredictor.Nfl.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{source: %Game{}}

  """
  def change_game(%Game{} = game) do
    Game.changeset(game, %{})
  end
end
