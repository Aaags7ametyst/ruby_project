require 'test_helper'

class CommitteesDistrictsControllerTest < ActionController::TestCase
  setup do
    @committees_district = committees_districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committees_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committees_district" do
    assert_difference('CommitteesDistrict.count') do
      post :create, committees_district: { votes: @committees_district.votes }
    end

    assert_redirected_to committees_district_path(assigns(:committees_district))
  end

  test "should show committees_district" do
    get :show, id: @committees_district
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @committees_district
    assert_response :success
  end

  test "should update committees_district" do
    patch :update, id: @committees_district, committees_district: { votes: @committees_district.votes }
    assert_redirected_to committees_district_path(assigns(:committees_district))
  end

  test "should destroy committees_district" do
    assert_difference('CommitteesDistrict.count', -1) do
      delete :destroy, id: @committees_district
    end

    assert_redirected_to committees_districts_path
  end
end
