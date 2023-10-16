require "application_system_test_case"

class AudiosTest < ApplicationSystemTestCase
  setup do
    @audio = audios(:one)
  end

  test "visiting the index" do
    visit audios_url
    assert_selector "h1", text: "Audios"
  end

  test "should create audio" do
    visit audios_url
    click_on "New audio"

    fill_in "Link", with: @audio.link
    fill_in "Post", with: @audio.post_id
    click_on "Create Audio"

    assert_text "Audio was successfully created"
    click_on "Back"
  end

  test "should update Audio" do
    visit audio_url(@audio)
    click_on "Edit this audio", match: :first

    fill_in "Link", with: @audio.link
    fill_in "Post", with: @audio.post_id
    click_on "Update Audio"

    assert_text "Audio was successfully updated"
    click_on "Back"
  end

  test "should destroy Audio" do
    visit audio_url(@audio)
    click_on "Destroy this audio", match: :first

    assert_text "Audio was successfully destroyed"
  end
end
