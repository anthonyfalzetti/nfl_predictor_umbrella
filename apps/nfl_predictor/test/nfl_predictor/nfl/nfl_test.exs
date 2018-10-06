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
end
