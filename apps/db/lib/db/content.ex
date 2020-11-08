defmodule DB.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias DB.Repo

  alias DB.Content.Art

  @doc """
  Returns the list of arts.

  ## Examples

      iex> list_arts()
      [%Art{}, ...]

  """
  def list_arts do
    Repo.all(Art)
  end

  @doc """
  Gets a single art.

  Raises `Ecto.NoResultsError` if the Art does not exist.

  ## Examples

      iex> get_art!(123)
      %Art{}

      iex> get_art!(456)
      ** (Ecto.NoResultsError)

  """
  def get_art!(id), do: Repo.get!(Art, id)

  @doc """
  Creates a art.

  ## Examples

      iex> create_art(%{field: value})
      {:ok, %Art{}}

      iex> create_art(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_art(attrs \\ %{}) do
    %Art{}
    |> Art.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a art.

  ## Examples

      iex> update_art(art, %{field: new_value})
      {:ok, %Art{}}

      iex> update_art(art, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_art(%Art{} = art, attrs) do
    art
    |> Art.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a art.

  ## Examples

      iex> delete_art(art)
      {:ok, %Art{}}

      iex> delete_art(art)
      {:error, %Ecto.Changeset{}}

  """
  def delete_art(%Art{} = art) do
    Repo.delete(art)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking art changes.

  ## Examples

      iex> change_art(art)
      %Ecto.Changeset{data: %Art{}}

  """
  def change_art(%Art{} = art, attrs \\ %{}) do
    Art.changeset(art, attrs)
  end
end
