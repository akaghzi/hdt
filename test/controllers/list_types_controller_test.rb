require 'test_helper'

class ListTypesControllerTest < ActionController::TestCase
  setup do
    @list_type = list_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_type" do
    assert_difference('ListType.count') do
      post :create, list_type: { description: @list_type.description, name: @list_type.name }
    end

    assert_redirected_to list_type_path(assigns(:list_type))
  end

  test "should show list_type" do
    get :show, id: @list_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_type
    assert_response :success
  end

  test "should update list_type" do
    patch :update, id: @list_type, list_type: { description: @list_type.description, name: @list_type.name }
    assert_redirected_to list_type_path(assigns(:list_type))
  end

  test "should destroy list_type" do
    assert_difference('ListType.count', -1) do
      delete :destroy, id: @list_type
    end

    assert_redirected_to list_types_path
  end
end
