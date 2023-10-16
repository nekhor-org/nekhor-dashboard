require "test_helper"

class LocalNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @local_name = local_names(:one)
  end

  test "should get index" do
    get local_names_url
    assert_response :success
  end

  test "should get new" do
    get new_local_name_url
    assert_response :success
  end

  test "should create local_name" do
    assert_difference("LocalName.count") do
      post local_names_url, params: { local_name: { language_id: @local_name.language_id, local_id: @local_name.local_id, name: @local_name.name } }
    end

    assert_redirected_to local_name_url(LocalName.last)
  end

  test "should show local_name" do
    get local_name_url(@local_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_local_name_url(@local_name)
    assert_response :success
  end

  test "should update local_name" do
    patch local_name_url(@local_name), params: { local_name: { language_id: @local_name.language_id, local_id: @local_name.local_id, name: @local_name.name } }
    assert_redirected_to local_name_url(@local_name)
  end

  test "should destroy local_name" do
    assert_difference("LocalName.count", -1) do
      delete local_name_url(@local_name)
    end

    assert_redirected_to local_names_url
  end
end
