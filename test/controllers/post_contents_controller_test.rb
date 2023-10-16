require "test_helper"

class PostContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_content = post_contents(:one)
  end

  test "should get index" do
    get post_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_post_content_url
    assert_response :success
  end

  test "should create post_content" do
    assert_difference("PostContent.count") do
      post post_contents_url, params: { post_content: { content: @post_content.content, language_id: @post_content.language_id, post_id: @post_content.post_id, subtitle: @post_content.subtitle, title: @post_content.title } }
    end

    assert_redirected_to post_content_url(PostContent.last)
  end

  test "should show post_content" do
    get post_content_url(@post_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_content_url(@post_content)
    assert_response :success
  end

  test "should update post_content" do
    patch post_content_url(@post_content), params: { post_content: { content: @post_content.content, language_id: @post_content.language_id, post_id: @post_content.post_id, subtitle: @post_content.subtitle, title: @post_content.title } }
    assert_redirected_to post_content_url(@post_content)
  end

  test "should destroy post_content" do
    assert_difference("PostContent.count", -1) do
      delete post_content_url(@post_content)
    end

    assert_redirected_to post_contents_url
  end
end
