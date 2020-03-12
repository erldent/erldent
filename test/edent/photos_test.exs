defmodule Edent.PhotosTest do
  use Edent.DataCase

  alias Edent.Photos

  describe "photos" do
    alias Edent.Photos.Photo

    @valid_attrs %{comments: "some comments", t: ~D[2010-04-17], tooth: 42}
    @update_attrs %{comments: "some updated comments", t: ~D[2011-05-18], tooth: 43}
    @invalid_attrs %{comments: nil, t: nil, tooth: nil}

    def photo_fixture(attrs \\ %{}) do
      {:ok, photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Photos.create_photo()

      photo
    end

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Photos.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Photos.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      assert {:ok, %Photo{} = photo} = Photos.create_photo(@valid_attrs)
      assert photo.comments == "some comments"
      assert photo.t == ~D[2010-04-17]
      assert photo.tooth == 42
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Photos.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{} = photo} = Photos.update_photo(photo, @update_attrs)
      assert photo.comments == "some updated comments"
      assert photo.t == ~D[2011-05-18]
      assert photo.tooth == 43
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Photos.update_photo(photo, @invalid_attrs)
      assert photo == Photos.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Photos.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Photos.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Photos.change_photo(photo)
    end
  end

  describe "photos" do
    alias Edent.Photos.Photo

    @valid_attrs %{comments: "some comments", filename: "some filename", t: ~D[2010-04-17], tooth: 42}
    @update_attrs %{comments: "some updated comments", filename: "some updated filename", t: ~D[2011-05-18], tooth: 43}
    @invalid_attrs %{comments: nil, filename: nil, t: nil, tooth: nil}

    def photo_fixture(attrs \\ %{}) do
      {:ok, photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Photos.create_photo()

      photo
    end

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Photos.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Photos.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      assert {:ok, %Photo{} = photo} = Photos.create_photo(@valid_attrs)
      assert photo.comments == "some comments"
      assert photo.filename == "some filename"
      assert photo.t == ~D[2010-04-17]
      assert photo.tooth == 42
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Photos.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{} = photo} = Photos.update_photo(photo, @update_attrs)
      assert photo.comments == "some updated comments"
      assert photo.filename == "some updated filename"
      assert photo.t == ~D[2011-05-18]
      assert photo.tooth == 43
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Photos.update_photo(photo, @invalid_attrs)
      assert photo == Photos.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Photos.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Photos.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Photos.change_photo(photo)
    end
  end
end
