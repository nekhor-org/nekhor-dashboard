require "test_helper"

class CountryNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_name = country_names(:one)
  end

  test "should get index" do
    get country_names_url
    assert_response :success
  end

  test "should get new" do
    get new_country_name_url
    assert_response :success
  end

  test "should create country_name" do
    assert_difference("CountryName.count") do
      post country_names_url, params: { country_name: { country_id: @country_name.country_id, language_id: @country_name.language_id, name: @country_name.name } }
    end

    assert_redirected_to country_name_url(CountryName.last)
  end

  test "should show country_name" do
    get country_name_url(@country_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_name_url(@country_name)
    assert_response :success
  end

  test "should update country_name" do
    patch country_name_url(@country_name), params: { country_name: { country_id: @country_name.country_id, language_id: @country_name.language_id, name: @country_name.name } }
    assert_redirected_to country_name_url(@country_name)
  end

  test "should destroy country_name" do
    assert_difference("CountryName.count", -1) do
      delete country_name_url(@country_name)
    end

    assert_redirected_to country_names_url
  end
end
