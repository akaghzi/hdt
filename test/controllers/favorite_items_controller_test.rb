require 'test_helper'

class FavoriteItemsControllerTest < ActionController::TestCase
  setup do
    @favorite_item = favorite_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_item" do
    assert_difference('FavoriteItem.count') do
      post :create, favorite_item: { brand_id: @favorite_item.brand_id, identifier: @favorite_item.identifier, imported_at: @favorite_item.imported_at, item_category_id: @favorite_item.item_category_id, name: @favorite_item.name, price: @favorite_item.price, quantity: @favorite_item.quantity, store_id: @favorite_item.store_id, unit_id: @favorite_item.unit_id, user_id: @favorite_item.user_id }
    end

    assert_redirected_to favorite_item_path(assigns(:favorite_item))
  end

  test "should show favorite_item" do
    get :show, id: @favorite_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_item
    assert_response :success
  end

  test "should update favorite_item" do
    patch :update, id: @favorite_item, favorite_item: { brand_id: @favorite_item.brand_id, identifier: @favorite_item.identifier, imported_at: @favorite_item.imported_at, item_category_id: @favorite_item.item_category_id, name: @favorite_item.name, price: @favorite_item.price, quantity: @favorite_item.quantity, store_id: @favorite_item.store_id, unit_id: @favorite_item.unit_id, user_id: @favorite_item.user_id }
    assert_redirected_to favorite_item_path(assigns(:favorite_item))
  end

  test "should destroy favorite_item" do
    assert_difference('FavoriteItem.count', -1) do
      delete :destroy, id: @favorite_item
    end

    assert_redirected_to favorite_items_path
  end
end
