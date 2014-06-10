require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { brand_id: @list.brand_id, identifier: @list.identifier, item_category_id: @list.item_category_id, list_type_id: @list.list_type_id, name: @list.name, price: @list.price, quantity: @list.quantity, store_id: @list.store_id, unit_id: @list.unit_id, user_id: @list.user_id }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, id: @list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update list" do
    patch :update, id: @list, list: { brand_id: @list.brand_id, identifier: @list.identifier, item_category_id: @list.item_category_id, list_type_id: @list.list_type_id, name: @list.name, price: @list.price, quantity: @list.quantity, store_id: @list.store_id, unit_id: @list.unit_id, user_id: @list.user_id }
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end
end
