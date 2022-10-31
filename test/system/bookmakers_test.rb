require "application_system_test_case"

class BookmakersTest < ApplicationSystemTestCase
  setup do
    @bookmaker = bookmakers(:one)
  end

  test "visiting the index" do
    visit bookmakers_url
    assert_selector "h1", text: "Bookmakers"
  end

  test "should create bookmaker" do
    visit bookmakers_url
    click_on "New bookmaker"

    click_on "Create Bookmaker"

    assert_text "Bookmaker was successfully created"
    click_on "Back"
  end

  test "should update Bookmaker" do
    visit bookmaker_url(@bookmaker)
    click_on "Edit this bookmaker", match: :first

    click_on "Update Bookmaker"

    assert_text "Bookmaker was successfully updated"
    click_on "Back"
  end

  test "should destroy Bookmaker" do
    visit bookmaker_url(@bookmaker)
    click_on "Destroy this bookmaker", match: :first

    assert_text "Bookmaker was successfully destroyed"
  end
end
