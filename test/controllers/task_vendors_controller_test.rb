require 'test_helper'

class TaskVendorsControllerTest < ActionController::TestCase
  setup do
    @task_vendor = task_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_vendor" do
    assert_difference('TaskVendor.count') do
      post :create, task_vendor: { price: @task_vendor.price, task_id: @task_vendor.task_id, vendor_id: @task_vendor.vendor_id }
    end

    assert_redirected_to task_vendor_path(assigns(:task_vendor))
  end

  test "should show task_vendor" do
    get :show, id: @task_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_vendor
    assert_response :success
  end

  test "should update task_vendor" do
    patch :update, id: @task_vendor, task_vendor: { price: @task_vendor.price, task_id: @task_vendor.task_id, vendor_id: @task_vendor.vendor_id }
    assert_redirected_to task_vendor_path(assigns(:task_vendor))
  end

  test "should destroy task_vendor" do
    assert_difference('TaskVendor.count', -1) do
      delete :destroy, id: @task_vendor
    end

    assert_redirected_to task_vendors_path
  end
end
