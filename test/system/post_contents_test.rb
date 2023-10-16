require "application_system_test_case"

class PostContentsTest < ApplicationSystemTestCase
  setup do
    @post_content = post_contents(:one)
  end

  test "visiting the index" do
    visit post_contents_url
    assert_selector "h1", text: "Post contents"
  end

  test "should create post content" do
    visit post_contents_url
    click_on "New post content"

    fill_in "Content", with: @post_content.content
    fill_in "Language", with: @post_content.language_id
    fill_in "Post", with: @post_content.post_id
    fill_in "Subtitle", with: @post_content.subtitle
    fill_in "Title", with: @post_content.title
    click_on "Create Post content"

    assert_text "Post content was successfully created"
    click_on "Back"
  end

  test "should update Post content" do
    visit post_content_url(@post_content)
    click_on "Edit this post content", match: :first

    fill_in "Content", with: @post_content.content
    fill_in "Language", with: @post_content.language_id
    fill_in "Post", with: @post_content.post_id
    fill_in "Subtitle", with: @post_content.subtitle
    fill_in "Title", with: @post_content.title
    click_on "Update Post content"

    assert_text "Post content was successfully updated"
    click_on "Back"
  end

  test "should destroy Post content" do
    visit post_content_url(@post_content)
    click_on "Destroy this post content", match: :first

    assert_text "Post content was successfully destroyed"
  end
end
