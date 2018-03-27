require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_index_url
    assert_response :success
  end

  test "should get show" do
    get question_show_url
    assert_response :success
  end

  test "should get edit" do
    get question_edit_url
    assert_response :success
  end

  test "should get delete" do
    get question_delete_url
    assert_response :success
  end

  test "should get new" do
    get question_new_url
    assert_response :success
  end

end
