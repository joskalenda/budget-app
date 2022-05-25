require "test_helper"

class CategoryEntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category_entities_index_url
    assert_response :success
  end

  test "should get show" do
    get category_entities_show_url
    assert_response :success
  end

  test "should get new" do
    get category_entities_new_url
    assert_response :success
  end

  test "should get edit" do
    get category_entities_edit_url
    assert_response :success
  end
end
