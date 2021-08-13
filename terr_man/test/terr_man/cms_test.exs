defmodule TerrMan.CMSTest do
  use TerrMan.DataCase

  alias TerrMan.CMS

  describe "pages" do
    alias TerrMan.CMS.Page

    @valid_attrs %{body: "some body", integer: "some integer", title: "some title", views: "some views"}
    @update_attrs %{body: "some updated body", integer: "some updated integer", title: "some updated title", views: "some updated views"}
    @invalid_attrs %{body: nil, integer: nil, title: nil, views: nil}

    def page_fixture(attrs \\ %{}) do
      {:ok, page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_page()

      page
    end

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert CMS.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert CMS.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      assert {:ok, %Page{} = page} = CMS.create_page(@valid_attrs)
      assert page.body == "some body"
      assert page.integer == "some integer"
      assert page.title == "some title"
      assert page.views == "some views"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      assert {:ok, %Page{} = page} = CMS.update_page(page, @update_attrs)
      assert page.body == "some updated body"
      assert page.integer == "some updated integer"
      assert page.title == "some updated title"
      assert page.views == "some updated views"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_page(page, @invalid_attrs)
      assert page == CMS.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = CMS.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = CMS.change_page(page)
    end
  end
end
