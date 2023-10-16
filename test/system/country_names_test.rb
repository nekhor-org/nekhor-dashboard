require "application_system_test_case"

class CountryNamesTest < ApplicationSystemTestCase
  setup do
    @country_name = country_names(:one)
  end

  test "visiting the index" do
    visit country_names_url
    assert_selector "h1", text: "Country names"
  end

  test "should create country name" do
    visit country_names_url
    click_on "New country name"

    fill_in "Country", with: @country_name.country_id
    fill_in "Language", with: @country_name.language_id
    fill_in "Name", with: @country_name.name
    click_on "Create Country name"

    assert_text "Country name was successfully created"
    click_on "Back"
  end

  test "should update Country name" do
    visit country_name_url(@country_name)
    click_on "Edit this country name", match: :first

    fill_in "Country", with: @country_name.country_id
    fill_in "Language", with: @country_name.language_id
    fill_in "Name", with: @country_name.name
    click_on "Update Country name"

    assert_text "Country name was successfully updated"
    click_on "Back"
  end

  test "should destroy Country name" do
    visit country_name_url(@country_name)
    click_on "Destroy this country name", match: :first

    assert_text "Country name was successfully destroyed"
  end
end
