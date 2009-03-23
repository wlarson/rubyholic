require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should show search results" do
    get :show, :q => groups(:one).name
    assert_response :success
    assert assigns(:search_results)
  end
end
