require "test_helper"

class AudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio = audios(:one)
  end

  test "should get index" do
    get audios_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_url
    assert_response :success
  end

  test "should create audio" do
    assert_difference("Audio.count") do
      post audios_url, params: { audio: { link: @audio.link, post_id: @audio.post_id } }
    end

    assert_redirected_to audio_url(Audio.last)
  end

  test "should show audio" do
    get audio_url(@audio)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_url(@audio)
    assert_response :success
  end

  test "should update audio" do
    patch audio_url(@audio), params: { audio: { link: @audio.link, post_id: @audio.post_id } }
    assert_redirected_to audio_url(@audio)
  end

  test "should destroy audio" do
    assert_difference("Audio.count", -1) do
      delete audio_url(@audio)
    end

    assert_redirected_to audios_url
  end
end
