require 'test_helper'

class ContactReasonsControllerTest < ActionController::TestCase
  setup do
    @contact_reason = contact_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_reason" do
    assert_difference('ContactReason.count') do
      post :create, contact_reason: { name: @contact_reason.name }
    end

    assert_redirected_to contact_reason_path(assigns(:contact_reason))
  end

  test "should show contact_reason" do
    get :show, id: @contact_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_reason
    assert_response :success
  end

  test "should update contact_reason" do
    patch :update, id: @contact_reason, contact_reason: { name: @contact_reason.name }
    assert_redirected_to contact_reason_path(assigns(:contact_reason))
  end

  test "should destroy contact_reason" do
    assert_difference('ContactReason.count', -1) do
      delete :destroy, id: @contact_reason
    end

    assert_redirected_to contact_reasons_path
  end
end
