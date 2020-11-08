defmodule DB.Repo.Migrations.CreateArts do
  use Ecto.Migration

  def change do
    create table(:arts) do
      add :title, :string
      add :city, :string
      add :country, :string
      add :description, :string
      add :address, :string
      add :lat, :float
      add :lng, :float
      add :neighborhood, :string
      add :slug, :string
      add :state, :string
      add :website, :string
      add :year, :integer
      add :zip, :string

      timestamps()
    end

  end
end
