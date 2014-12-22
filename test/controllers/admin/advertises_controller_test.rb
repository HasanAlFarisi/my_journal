require 'test_helper'

class Admin::AdvertisesControllerTest < ActionController::TestCase
  setup do
    @admin_advertise = admin_advertises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_advertises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_advertise" do
    assert_difference('Admin::Advertise.count') do
      post :create, admin_advertise: { image: @admin_advertise.image, status: @admin_advertise.status }
    end

    assert_redirected_to admin_advertise_path(assigns(:admin_advertise))
  end

  test "should show admin_advertise" do
    get :show, id: @admin_advertise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_advertise
    assert_response :success
  end

  test "should update admin_advertise" do
    patch :update, id: @admin_advertise, admin_advertise: { image: @admin_advertise.image, status: @admin_advertise.status }
    assert_redirected_to admin_advertise_path(assigns(:admin_advertise))
  end

  test "should destroy admin_advertise" do
    assert_difference('Admin::Advertise.count', -1) do
      delete :destroy, id: @admin_advertise
    end

    assert_redirected_to admin_advertises_path
  end
end
