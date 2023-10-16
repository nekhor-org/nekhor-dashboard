require "application_system_test_case"

class LabelsTest < ApplicationSystemTestCase
  setup do
    @label = labels(:one)
  end

  test "visiting the index" do
    visit labels_url
    assert_selector "h1", text: "Labels"
  end

  test "should create label" do
    visit labels_url
    click_on "New label"

    fill_in "Add", with: @label.add
    fill_in "Already visited", with: @label.already_visited
    fill_in "Choose itinerary name", with: @label.choose_itinerary_name
    fill_in "Delete", with: @label.delete
    fill_in "Edit", with: @label.edit
    fill_in "Language", with: @label.language_id
    fill_in "My favorites", with: @label.my_favorites
    fill_in "My itinerary", with: @label.my_itinerary
    fill_in "Remove all", with: @label.remove_all
    fill_in "Reorder", with: @label.reorder
    fill_in "Save", with: @label.save
    fill_in "Share", with: @label.share
    fill_in "View in map", with: @label.view_in_map
    click_on "Create Label"

    assert_text "Label was successfully created"
    click_on "Back"
  end

  test "should update Label" do
    visit label_url(@label)
    click_on "Edit this label", match: :first

    fill_in "Add", with: @label.add
    fill_in "Already visited", with: @label.already_visited
    fill_in "Choose itinerary name", with: @label.choose_itinerary_name
    fill_in "Delete", with: @label.delete
    fill_in "Edit", with: @label.edit
    fill_in "Language", with: @label.language_id
    fill_in "My favorites", with: @label.my_favorites
    fill_in "My itinerary", with: @label.my_itinerary
    fill_in "Remove all", with: @label.remove_all
    fill_in "Reorder", with: @label.reorder
    fill_in "Save", with: @label.save
    fill_in "Share", with: @label.share
    fill_in "View in map", with: @label.view_in_map
    click_on "Update Label"

    assert_text "Label was successfully updated"
    click_on "Back"
  end

  test "should destroy Label" do
    visit label_url(@label)
    click_on "Destroy this label", match: :first

    assert_text "Label was successfully destroyed"
  end
end
