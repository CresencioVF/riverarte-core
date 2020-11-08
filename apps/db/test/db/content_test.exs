defmodule DB.ContentTest do
  use DB.DataCase

  alias DB.Content

  describe "arts" do
    alias DB.Content.Art

    @valid_attrs %{address: "some address", city: "some city", country: "some country", description: "some description", lat: 120.5, lng: 120.5, neighborhood: "some neighborhood", slug: "some slug", state: "some state", title: "some title", website: "some website", year: 42, zip: "some zip"}
    @update_attrs %{address: "some updated address", city: "some updated city", country: "some updated country", description: "some updated description", lat: 456.7, lng: 456.7, neighborhood: "some updated neighborhood", slug: "some updated slug", state: "some updated state", title: "some updated title", website: "some updated website", year: 43, zip: "some updated zip"}
    @invalid_attrs %{address: nil, city: nil, country: nil, description: nil, lat: nil, lng: nil, neighborhood: nil, slug: nil, state: nil, title: nil, website: nil, year: nil, zip: nil}

    def art_fixture(attrs \\ %{}) do
      {:ok, art} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_art()

      art
    end

    test "list_arts/0 returns all arts" do
      art = art_fixture()
      assert Content.list_arts() == [art]
    end

    test "get_art!/1 returns the art with given id" do
      art = art_fixture()
      assert Content.get_art!(art.id) == art
    end

    test "create_art/1 with valid data creates a art" do
      assert {:ok, %Art{} = art} = Content.create_art(@valid_attrs)
      assert art.address == "some address"
      assert art.city == "some city"
      assert art.country == "some country"
      assert art.description == "some description"
      assert art.lat == 120.5
      assert art.lng == 120.5
      assert art.neighborhood == "some neighborhood"
      assert art.slug == "some slug"
      assert art.state == "some state"
      assert art.title == "some title"
      assert art.website == "some website"
      assert art.year == 42
      assert art.zip == "some zip"
    end

    test "create_art/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_art(@invalid_attrs)
    end

    test "update_art/2 with valid data updates the art" do
      art = art_fixture()
      assert {:ok, %Art{} = art} = Content.update_art(art, @update_attrs)
      assert art.address == "some updated address"
      assert art.city == "some updated city"
      assert art.country == "some updated country"
      assert art.description == "some updated description"
      assert art.lat == 456.7
      assert art.lng == 456.7
      assert art.neighborhood == "some updated neighborhood"
      assert art.slug == "some updated slug"
      assert art.state == "some updated state"
      assert art.title == "some updated title"
      assert art.website == "some updated website"
      assert art.year == 43
      assert art.zip == "some updated zip"
    end

    test "update_art/2 with invalid data returns error changeset" do
      art = art_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_art(art, @invalid_attrs)
      assert art == Content.get_art!(art.id)
    end

    test "delete_art/1 deletes the art" do
      art = art_fixture()
      assert {:ok, %Art{}} = Content.delete_art(art)
      assert_raise Ecto.NoResultsError, fn -> Content.get_art!(art.id) end
    end

    test "change_art/1 returns a art changeset" do
      art = art_fixture()
      assert %Ecto.Changeset{} = Content.change_art(art)
    end
  end
end
