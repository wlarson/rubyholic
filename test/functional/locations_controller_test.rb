require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "index should load no more than 10 locations" do
    assert Location.count > 10, "Test requires 11+ location fixtures"
    get :index
    assert_equal 10, assigns(:locations).size
  end

  test "index can order locations by name" do
    get :index, :order_by => 'name'
    expected = Location.find(:all, :limit => 10, :order => 'name')
    assert_equal expected, assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, :location => { 
        :name => 'new loc', :address => 'Seattle, WA' }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, :id => locations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => locations(:one).id
    assert_response :success
  end

  test "should update location" do
    put :update, :id => locations(:one).id, :location => { }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:one).id
    end

    assert_redirected_to locations_path
  end
end
