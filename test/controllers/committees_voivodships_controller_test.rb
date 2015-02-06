require 'test_helper'

class CommitteesVoivodshipsControllerTest < ActionController::TestCase
  setup do
    @committees_voivodship = committees_voivodships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committees_voivodships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committees_voivodship" do
    assert_difference('CommitteesVoivodship.count') do
      post :create, committees_voivodship: { number_of_votes: @committees_voivodship.number_of_votes }
    end

    assert_redirected_to committees_voivodship_path(assigns(:committees_voivodship))
  end

  test "should show committees_voivodship" do
    get :show, id: @committees_voivodship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @committees_voivodship
    assert_response :success
  end

  test "should update committees_voivodship" do
    patch :update, id: @committees_voivodship, committees_voivodship: { number_of_votes: @committees_voivodship.number_of_votes }
    assert_redirected_to committees_voivodship_path(assigns(:committees_voivodship))
  end

  test "should destroy committees_voivodship" do
    assert_difference('CommitteesVoivodship.count', -1) do
      delete :destroy, id: @committees_voivodship
    end

    assert_redirected_to committees_voivodships_path
  end
end
