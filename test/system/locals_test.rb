require "application_system_test_case"

class LocalsTest < ApplicationSystemTestCase
  setup do
    @local = locals(:one)
  end

  test "visiting the index" do
    visit locals_url
    assert_selector "h1", text: "Locals"
  end

  test "should create local" do
    visit locals_url
    click_on "New local"

    fill_in "Name", with: @local.name
    click_on "Create Local"

    assert_text "Local was successfully created"
    click_on "Back"
  end

  test "should update Local" do
    visit local_url(@local)
    click_on "Edit this local", match: :first

    fill_in "Name", with: @local.name
    click_on "Update Local"

    assert_text "Local was successfully updated"
    click_on "Back"
  end

  test "should destroy Local" do
    visit local_url(@local)
    click_on "Destroy this local", match: :first

    assert_text "Local was successfully destroyed"
  end
end
