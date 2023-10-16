require "application_system_test_case"

class LocalNamesTest < ApplicationSystemTestCase
  setup do
    @local_name = local_names(:one)
  end

  test "visiting the index" do
    visit local_names_url
    assert_selector "h1", text: "Local names"
  end

  test "should create local name" do
    visit local_names_url
    click_on "New local name"

    fill_in "Language", with: @local_name.language_id
    fill_in "Local", with: @local_name.local_id
    fill_in "Name", with: @local_name.name
    click_on "Create Local name"

    assert_text "Local name was successfully created"
    click_on "Back"
  end

  test "should update Local name" do
    visit local_name_url(@local_name)
    click_on "Edit this local name", match: :first

    fill_in "Language", with: @local_name.language_id
    fill_in "Local", with: @local_name.local_id
    fill_in "Name", with: @local_name.name
    click_on "Update Local name"

    assert_text "Local name was successfully updated"
    click_on "Back"
  end

  test "should destroy Local name" do
    visit local_name_url(@local_name)
    click_on "Destroy this local name", match: :first

    assert_text "Local name was successfully destroyed"
  end
end
