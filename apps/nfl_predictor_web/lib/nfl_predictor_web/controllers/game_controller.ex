defmodule NflPredictorWeb.GameController do
  use NflPredictorWeb, :controller

  alias NflPredictor.Nfl
  alias NflPredictor.Nfl.Game

  action_fallback NflPredictorWeb.FallbackController

  def index(conn, _params) do
    games = Nfl.list_games()
    render(conn, "index.json", games: games)
  end

  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- Nfl.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", game_path(conn, :show, game))
      |> render("show.json", game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    game = Nfl.get_game!(id)
    render(conn, "show.json", game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = Nfl.get_game!(id)

    with {:ok, %Game{} = game} <- Nfl.update_game(game, game_params) do
      render(conn, "show.json", game: game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Nfl.get_game!(id)
    with {:ok, %Game{}} <- Nfl.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end
end
