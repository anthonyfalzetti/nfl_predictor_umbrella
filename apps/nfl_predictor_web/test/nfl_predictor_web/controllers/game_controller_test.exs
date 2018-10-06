defmodule NflPredictorWeb.GameControllerTest do
  use NflPredictorWeb.ConnCase

  alias NflPredictor.Nfl
  alias NflPredictor.Nfl.Game

  @create_attrs %{end_time: ~N[2010-04-17 14:00:00.000000], start_time: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{end_time: ~N[2011-05-18 15:01:01.000000], start_time: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{end_time: nil, start_time: nil}

  def fixture(:game) do
    {:ok, game} = Nfl.create_game(@create_attrs)
    game
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get conn, game_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game" do
    test "renders game when data is valid", %{conn: conn} do
      conn = post conn, game_path(conn, :create), game: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, game_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end_time" => ~N[2010-04-17 14:00:00.000000],
        "start_time" => ~N[2010-04-17 14:00:00.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, game_path(conn, :create), game: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game" do
    setup [:create_game]

    test "renders game when data is valid", %{conn: conn, game: %Game{id: id} = game} do
      conn = put conn, game_path(conn, :update, game), game: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, game_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end_time" => ~N[2011-05-18 15:01:01.000000],
        "start_time" => ~N[2011-05-18 15:01:01.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put conn, game_path(conn, :update, game), game: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game" do
    setup [:create_game]

    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete conn, game_path(conn, :delete, game)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, game_path(conn, :show, game)
      end
    end
  end

  defp create_game(_) do
    game = fixture(:game)
    {:ok, game: game}
  end
end
