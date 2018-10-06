defmodule NflPredictorWeb.WeatherControllerTest do
  use NflPredictorWeb.ConnCase

  alias NflPredictor.Nfl
  alias NflPredictor.Nfl.Weather

  @create_attrs %{precip_intensity: 120.5, precip_type: "some precip_type", temperature: 120.5, time: ~N[2010-04-17 14:00:00.000000], visibility: 120.5, wind_gust: 120.5, wind_speed: 120.5}
  @update_attrs %{precip_intensity: 456.7, precip_type: "some updated precip_type", temperature: 456.7, time: ~N[2011-05-18 15:01:01.000000], visibility: 456.7, wind_gust: 456.7, wind_speed: 456.7}
  @invalid_attrs %{precip_intensity: nil, precip_type: nil, temperature: nil, time: nil, visibility: nil, wind_gust: nil, wind_speed: nil}

  def fixture(:weather) do
    {:ok, weather} = Nfl.create_weather(@create_attrs)
    weather
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all weather", %{conn: conn} do
      conn = get conn, weather_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create weather" do
    test "renders weather when data is valid", %{conn: conn} do
      conn = post conn, weather_path(conn, :create), weather: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, weather_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "precip_intensity" => 120.5,
        "precip_type" => "some precip_type",
        "temperature" => 120.5,
        "time" => ~N[2010-04-17 14:00:00.000000],
        "visibility" => 120.5,
        "wind_gust" => 120.5,
        "wind_speed" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, weather_path(conn, :create), weather: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update weather" do
    setup [:create_weather]

    test "renders weather when data is valid", %{conn: conn, weather: %Weather{id: id} = weather} do
      conn = put conn, weather_path(conn, :update, weather), weather: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, weather_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "precip_intensity" => 456.7,
        "precip_type" => "some updated precip_type",
        "temperature" => 456.7,
        "time" => ~N[2011-05-18 15:01:01.000000],
        "visibility" => 456.7,
        "wind_gust" => 456.7,
        "wind_speed" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, weather: weather} do
      conn = put conn, weather_path(conn, :update, weather), weather: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete weather" do
    setup [:create_weather]

    test "deletes chosen weather", %{conn: conn, weather: weather} do
      conn = delete conn, weather_path(conn, :delete, weather)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, weather_path(conn, :show, weather)
      end
    end
  end

  defp create_weather(_) do
    weather = fixture(:weather)
    {:ok, weather: weather}
  end
end
