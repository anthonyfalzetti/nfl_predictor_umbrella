defmodule NflPredictor.NflTest do
  use NflPredictor.DataCase
  import NflPredictor.Factory

  alias NflPredictor.Nfl

  describe "stadiums" do
    alias NflPredictor.Nfl.Stadium

    @valid_attrs %{capacity: 42, city: "some city", elevation: 42, latitude: 120.5, longitude: 120.5, name: "some name", playing_surface: "some playing_surface", roof_type: "some roof_type", state: "some state"}
    @update_attrs %{capacity: 43, city: "some updated city", elevation: 43, latitude: 456.7, longitude: 456.7, name: "some updated name", playing_surface: "some updated playing_surface", roof_type: "some updated roof_type", state: "some updated state"}
    @invalid_attrs %{capacity: nil, city: nil, elevation: nil, latitude: nil, longitude: nil, name: nil, playing_surface: nil, roof_type: nil, state: nil}

    def stadium_fixture(attrs \\ %{}) do
      {:ok, stadium} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nfl.create_stadium()

      stadium
    end

    test "list_stadiums/0 returns all stadiums" do
      stadium = stadium_fixture()
      assert Nfl.list_stadiums() == [stadium]
    end

    test "get_stadium!/1 returns the stadium with given id" do
      stadium = stadium_fixture()
      assert Nfl.get_stadium!(stadium.id) == stadium
    end

    test "create_stadium/1 with valid data creates a stadium" do
      assert {:ok, %Stadium{} = stadium} = Nfl.create_stadium(@valid_attrs)
      assert stadium.capacity == 42
      assert stadium.city == "some city"
      assert stadium.elevation == 42
      assert stadium.latitude == 120.5
      assert stadium.longitude == 120.5
      assert stadium.name == "some name"
      assert stadium.playing_surface == "some playing_surface"
      assert stadium.roof_type == "some roof_type"
      assert stadium.state == "some state"
    end

    test "create_stadium/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_stadium(@invalid_attrs)
    end

    test "update_stadium/2 with valid data updates the stadium" do
      stadium = stadium_fixture()
      assert {:ok, stadium} = Nfl.update_stadium(stadium, @update_attrs)
      assert %Stadium{} = stadium
      assert stadium.capacity == 43
      assert stadium.city == "some updated city"
      assert stadium.elevation == 43
      assert stadium.latitude == 456.7
      assert stadium.longitude == 456.7
      assert stadium.name == "some updated name"
      assert stadium.playing_surface == "some updated playing_surface"
      assert stadium.roof_type == "some updated roof_type"
      assert stadium.state == "some updated state"
    end

    test "update_stadium/2 with invalid data returns error changeset" do
      stadium = stadium_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_stadium(stadium, @invalid_attrs)
      assert stadium == Nfl.get_stadium!(stadium.id)
    end

    test "delete_stadium/1 deletes the stadium" do
      stadium = stadium_fixture()
      assert {:ok, %Stadium{}} = Nfl.delete_stadium(stadium)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_stadium!(stadium.id) end
    end

    test "change_stadium/1 returns a stadium changeset" do
      stadium = stadium_fixture()
      assert %Ecto.Changeset{} = Nfl.change_stadium(stadium)
    end
  end

  describe "conferences" do
    alias NflPredictor.Nfl.Conference

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def conference_fixture(attrs \\ %{}) do
      {:ok, conference} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nfl.create_conference()

      conference
    end

    test "list_conferences/0 returns all conferences" do
      conference = conference_fixture()
      assert Nfl.list_conferences() == [conference]
    end

    test "get_conference!/1 returns the conference with given id" do
      conference = conference_fixture()
      assert Nfl.get_conference!(conference.id) == conference
    end

    test "create_conference/1 with valid data creates a conference" do
      assert {:ok, %Conference{} = conference} = Nfl.create_conference(@valid_attrs)
      assert conference.name == "some name"
    end

    test "create_conference/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_conference(@invalid_attrs)
    end

    test "update_conference/2 with valid data updates the conference" do
      conference = conference_fixture()
      assert {:ok, conference} = Nfl.update_conference(conference, @update_attrs)
      assert %Conference{} = conference
      assert conference.name == "some updated name"
    end

    test "update_conference/2 with invalid data returns error changeset" do
      conference = conference_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_conference(conference, @invalid_attrs)
      assert conference == Nfl.get_conference!(conference.id)
    end

    test "delete_conference/1 deletes the conference" do
      conference = conference_fixture()
      assert {:ok, %Conference{}} = Nfl.delete_conference(conference)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_conference!(conference.id) end
    end

    test "change_conference/1 returns a conference changeset" do
      conference = conference_fixture()
      assert %Ecto.Changeset{} = Nfl.change_conference(conference)
    end
  end

  describe "divisions" do
    alias NflPredictor.Nfl.Division

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def division_fixture(attrs \\ %{}) do
      {:ok, division} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nfl.create_division()

      division
    end

    test "list_divisions/0 returns all divisions" do
      division = division_fixture()
      assert Nfl.list_divisions() == [division]
    end

    test "get_division!/1 returns the division with given id" do
      division = division_fixture()
      assert Nfl.get_division!(division.id) == division
    end

    test "create_division/1 with valid data creates a division" do
      assert {:ok, %Division{} = division} = Nfl.create_division(@valid_attrs)
      assert division.name == "some name"
    end

    test "create_division/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_division(@invalid_attrs)
    end

    test "update_division/2 with valid data updates the division" do
      division = division_fixture()
      assert {:ok, division} = Nfl.update_division(division, @update_attrs)
      assert %Division{} = division
      assert division.name == "some updated name"
    end

    test "update_division/2 with invalid data returns error changeset" do
      division = division_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_division(division, @invalid_attrs)
      assert division == Nfl.get_division!(division.id)
    end

    test "delete_division/1 deletes the division" do
      division = division_fixture()
      assert {:ok, %Division{}} = Nfl.delete_division(division)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_division!(division.id) end
    end

    test "change_division/1 returns a division changeset" do
      division = division_fixture()
      assert %Ecto.Changeset{} = Nfl.change_division(division)
    end
  end

  describe "teams" do
    alias NflPredictor.Nfl.Team

    @valid_attrs %{home_field_advantage: 42, name: "some name"}
    @update_attrs %{home_field_advantage: 43, name: "some updated name"}
    @invalid_attrs %{home_field_advantage: nil, name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nfl.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Nfl.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Nfl.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Nfl.create_team(@valid_attrs)
      assert team.home_field_advantage == 42
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, team} = Nfl.update_team(team, @update_attrs)
      assert %Team{} = team
      assert team.home_field_advantage == 43
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_team(team, @invalid_attrs)
      assert team == Nfl.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Nfl.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Nfl.change_team(team)
    end
  end

  describe "seasons" do
    alias NflPredictor.Nfl.Season

    @valid_attrs %{year: 42}
    @update_attrs %{year: 43}
    @invalid_attrs %{year: nil}

    def season_fixture(attrs \\ %{}) do
      {:ok, season} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nfl.create_season()

      season
    end

    test "list_seasons/0 returns all seasons" do
      season = season_fixture()
      assert Nfl.list_seasons() == [season]
    end

    test "get_season!/1 returns the season with given id" do
      season = season_fixture()
      assert Nfl.get_season!(season.id) == season
    end

    test "create_season/1 with valid data creates a season" do
      assert {:ok, %Season{} = season} = Nfl.create_season(@valid_attrs)
      assert season.year == 42
    end

    test "create_season/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_season(@invalid_attrs)
    end

    test "update_season/2 with valid data updates the season" do
      season = season_fixture()
      assert {:ok, season} = Nfl.update_season(season, @update_attrs)
      assert %Season{} = season
      assert season.year == 43
    end

    test "update_season/2 with invalid data returns error changeset" do
      season = season_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_season(season, @invalid_attrs)
      assert season == Nfl.get_season!(season.id)
    end

    test "delete_season/1 deletes the season" do
      season = season_fixture()
      assert {:ok, %Season{}} = Nfl.delete_season(season)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_season!(season.id) end
    end

    test "change_season/1 returns a season changeset" do
      season = season_fixture()
      assert %Ecto.Changeset{} = Nfl.change_season(season)
    end
  end

  describe "weeks" do
    alias NflPredictor.Nfl.Week

    @valid_attrs %{number: 42}
    @update_attrs %{number: 43}
    @invalid_attrs %{number: nil}

    def week_fixture(attrs \\ %{}) do
      season = insert(:season)

      {:ok, week} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.put(:season_id, season.id)
        |> Nfl.create_week()

      week
    end

    test "list_weeks/0 returns all weeks" do
      week = week_fixture()
      assert Nfl.list_weeks() == [week]
    end

    test "get_week!/1 returns the week with given id" do
      week = week_fixture()
      assert Nfl.get_week!(week.id) == week
    end

    test "create_week/1 with valid data creates a week" do
      valid_attrs = @valid_attrs
      |> Map.put(:season_id, insert(:season).id)

      assert {:ok, %Week{} = week} = Nfl.create_week(valid_attrs)
      assert week.number == 42
    end

    test "create_week/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_week(@invalid_attrs)
    end

    test "update_week/2 with valid data updates the week" do
      week = week_fixture()
      assert {:ok, week} = Nfl.update_week(week, @update_attrs)
      assert %Week{} = week
      assert week.number == 43
    end

    test "update_week/2 with invalid data returns error changeset" do
      week = week_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_week(week, @invalid_attrs)
      assert week == Nfl.get_week!(week.id)
    end

    test "delete_week/1 deletes the week" do
      week = week_fixture()
      assert {:ok, %Week{}} = Nfl.delete_week(week)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_week!(week.id) end
    end

    test "change_week/1 returns a week changeset" do
      week = week_fixture()
      assert %Ecto.Changeset{} = Nfl.change_week(week)
    end
  end

  describe "weather" do
    alias NflPredictor.Nfl.Weather

    @valid_attrs %{precip_intensity: 120.5, precip_type: "some precip_type", temperature: 120.5, time: ~N[2010-04-17 14:00:00.000000], visibility: 120.5, wind_gust: 120.5, wind_speed: 120.5}
    @update_attrs %{precip_intensity: 456.7, precip_type: "some updated precip_type", temperature: 456.7, time: ~N[2011-05-18 15:01:01.000000], visibility: 456.7, wind_gust: 456.7, wind_speed: 456.7}
    @invalid_attrs %{precip_intensity: nil, precip_type: nil, temperature: nil, time: nil, visibility: nil, wind_gust: nil, wind_speed: nil}

    def weather_fixture(attrs \\ %{}) do
      game = insert(:game)
      {:ok, weather} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.put(:game_id, game.id)
        |> Nfl.create_weather()

      weather
    end

    test "list_weather/0 returns all weather" do
      weather = weather_fixture()
      assert Nfl.list_weather() == [weather]
    end

    test "get_weather!/1 returns the weather with given id" do
      weather = weather_fixture()
      assert Nfl.get_weather!(weather.id) == weather
    end

    test "create_weather/1 with valid data creates a weather" do
      valid_attrs = @valid_attrs
      |> Map.put(:game_id, insert(:game).id)

      assert {:ok, %Weather{} = weather} = Nfl.create_weather(valid_attrs)
      assert weather.precip_intensity == 120.5
      assert weather.precip_type == "some precip_type"
      assert weather.temperature == 120.5
      assert weather.time == ~N[2010-04-17 14:00:00.000000]
      assert weather.visibility == 120.5
      assert weather.wind_gust == 120.5
      assert weather.wind_speed == 120.5
    end

    test "create_weather/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_weather(@invalid_attrs)
    end

    test "update_weather/2 with valid data updates the weather" do
      weather = weather_fixture()
      assert {:ok, weather} = Nfl.update_weather(weather, @update_attrs)
      assert %Weather{} = weather
      assert weather.precip_intensity == 456.7
      assert weather.precip_type == "some updated precip_type"
      assert weather.temperature == 456.7
      assert weather.time == ~N[2011-05-18 15:01:01.000000]
      assert weather.visibility == 456.7
      assert weather.wind_gust == 456.7
      assert weather.wind_speed == 456.7
    end

    test "update_weather/2 with invalid data returns error changeset" do
      weather = weather_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_weather(weather, @invalid_attrs)
      assert weather == Nfl.get_weather!(weather.id)
    end

    test "delete_weather/1 deletes the weather" do
      weather = weather_fixture()
      assert {:ok, %Weather{}} = Nfl.delete_weather(weather)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_weather!(weather.id) end
    end

    test "change_weather/1 returns a weather changeset" do
      weather = weather_fixture()
      assert %Ecto.Changeset{} = Nfl.change_weather(weather)
    end
  end

  describe "games" do
    alias NflPredictor.Nfl.Game

    @valid_attrs %{end_time: ~N[2010-04-17 14:00:00.000000], start_time: ~N[2010-04-17 14:00:00.000000], home_score: 21, away_score: 17, home_team_won: true, tie: false}
    @update_attrs %{end_time: ~N[2011-05-18 15:01:01.000000], start_time: ~N[2011-05-18 15:01:01.000000], home_score: 21, away_score: 17, home_team_won: true, tie: false}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def game_fixture(attrs \\ %{}) do
      additional_params = %{
        home_team_id: insert(:team).id,
        away_team_id: insert(:team).id,
        stadium_id: insert(:stadium).id,
        week_id: insert(:week).id
      }

      {:ok, game} = attrs
      |> Enum.into(@valid_attrs)
      |> Map.merge(additional_params)
      |> Nfl.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Nfl.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Nfl.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = @valid_attrs
      |> Map.put(:stadium_id, insert(:stadium).id)
      |> Map.put(:home_team_id, insert(:team).id)
      |> Map.put(:away_team_id, insert(:team).id)
      |> Map.put(:week_id, insert(:week).id)

      assert {:ok, %Game{} = game} = Nfl.create_game(valid_attrs)
      assert game.end_time == ~N[2010-04-17 14:00:00.000000]
      assert game.start_time == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nfl.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, game} = Nfl.update_game(game, @update_attrs)
      assert %Game{} = game
      assert game.end_time == ~N[2011-05-18 15:01:01.000000]
      assert game.start_time == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Nfl.update_game(game, @invalid_attrs)
      assert game == Nfl.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Nfl.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Nfl.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Nfl.change_game(game)
    end
  end
end
