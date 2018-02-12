require 'test_helper'

class NetasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get netas_new_url
    assert_response :success
  end

  test "should get create" do
    get netas_create_url
    assert_response :success
  end

  test "should get confirm" do
    get netas_confirm_url
    assert_response :success
  end

  test "should get edit" do
    get netas_edit_url
    assert_response :success
  end

  test "should get update" do
    get netas_update_url
    assert_response :success
  end

  test "should get index" do
    get netas_index_url
    assert_response :success
  end

  test "should get destroy" do
    get netas_destroy_url
    assert_response :success
  end

end
