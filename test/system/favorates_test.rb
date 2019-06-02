require "application_system_test_case"

class FavoratesTest < ApplicationSystemTestCase
  setup do
    @favorate = favorates(:one)
  end

  test "visiting the index" do
    visit favorates_url
    assert_selector "h1", text: "Favorates"
  end

  test "creating a Favorate" do
    visit favorates_url
    click_on "New Favorate"

    fill_in "imdb_id", with: @favorate.imdb_id
    click_on "Create Favorate"

    assert_text "Favorate was successfully created"
    click_on "Back"
  end

  test "updating a Favorate" do
    visit favorates_url
    click_on "Edit", match: :first

    fill_in "imdb_id", with: @favorate.imdb_id
    click_on "Update Favorate"

    assert_text "Favorate was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorate" do
    visit favorates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorate was successfully destroyed"
  end
end
