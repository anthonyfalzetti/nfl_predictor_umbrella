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
end
