defmodule NflPredictorWeb.GameView do
  use NflPredictorWeb, :view
  alias NflPredictorWeb.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      start_time: game.start_time,
      end_time: game.end_time}
  end
end
