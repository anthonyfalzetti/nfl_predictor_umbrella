defmodule NflPredictor.Seeds.Seasons do
  alias NflPredictor.Nfl.Season
  alias NflPredictor.Repo

  def seed do
    [2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018]
    |> Enum.each(fn(year) ->
      %Season{year: year} |> Repo.insert!
    end)
  end
end
