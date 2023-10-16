require "test_helper"

class LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @label = labels(:one)
  end

  test "should get index" do
    get labels_url
    assert_response :success
  end

  test "should get new" do
    get new_label_url
    assert_response :success
  end

  test "should create label" do
    assert_difference("Label.count") do
      post labels_url, params: { label: { add: @label.add, already_visited: @label.already_visited, choose_itinerary_name: @label.choose_itinerary_name, delete: @label.delete, edit: @label.edit, language_id: @label.language_id, my_favorites: @label.my_favorites, my_itinerary: @label.my_itinerary, remove_all: @label.remove_all, reorder: @label.reorder, save: @label.save, share: @label.share, view_in_map: @label.view_in_map } }
    end

    assert_redirected_to label_url(Label.last)
  end

  test "should show label" do
    get label_url(@label)
    assert_response :success
  end

  test "should get edit" do
    get edit_label_url(@label)
    assert_response :success
  end

  test "should update label" do
    patch label_url(@label), params: { label: { add: @label.add, already_visited: @label.already_visited, choose_itinerary_name: @label.choose_itinerary_name, delete: @label.delete, edit: @label.edit, language_id: @label.language_id, my_favorites: @label.my_favorites, my_itinerary: @label.my_itinerary, remove_all: @label.remove_all, reorder: @label.reorder, save: @label.save, share: @label.share, view_in_map: @label.view_in_map } }
    assert_redirected_to label_url(@label)
  end

  test "should destroy label" do
    assert_difference("Label.count", -1) do
      delete label_url(@label)
    end

    assert_redirected_to labels_url
  end
end
