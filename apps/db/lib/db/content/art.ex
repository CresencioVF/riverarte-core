defmodule DB.Content.Art do
  use Ecto.Schema
  import Ecto.Changeset

  schema "arts" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :description, :string
    field :lat, :float
    field :lng, :float
    field :neighborhood, :string
    field :slug, :string
    field :state, :string
    field :title, :string
    field :website, :string
    field :year, :integer
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(art, attrs) do
    art
    |> cast(attrs, [:title, :city, :country, :description, :address, :lat, :lng, :neighborhood, :slug, :state, :website, :year, :zip])
    |> validate_required([:title, :lat, :lng])
  end
end
