defmodule NflPredictor.NflTest do
  use NflPredictor.DataCase

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
end
