require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get words_index_url
    assert_response :success
  end

  test "should get create" do
    get words_create_url
    assert_response :success
  end

  test "should get edit" do
    get words_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get words_destroy_url
    assert_response :success
  end

end
