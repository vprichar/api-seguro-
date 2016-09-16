require 'test_helper'

class InsurancesControllerTest < ActionController::TestCase
  setup do
    @insurance = insurances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance" do
    assert_difference('Insurance.count') do
      post :create, insurance: { Description: @insurance.Description, expiration: @insurance.expiration, name: @insurance.name }
    end

    assert_redirected_to insurance_path(assigns(:insurance))
  end

  test "should show insurance" do
    get :show, id: @insurance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance
    assert_response :success
  end

  test "should update insurance" do
    patch :update, id: @insurance, insurance: { Description: @insurance.Description, expiration: @insurance.expiration, name: @insurance.name }
    assert_redirected_to insurance_path(assigns(:insurance))
  end

  test "should destroy insurance" do
    assert_difference('Insurance.count', -1) do
      delete :destroy, id: @insurance
    end

    assert_redirected_to insurances_path
  end
end
