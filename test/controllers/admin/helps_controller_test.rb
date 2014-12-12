require 'test_helper'

class Admin::HelpsControllerTest < ActionController::TestCase
  setup do
    @admin_help = admin_helps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_helps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_help" do
    assert_difference('Admin::Help.count') do
      post :create, admin_help: { e_mail: @admin_help.e_mail, full_name: @admin_help.full_name, help: @admin_help.help }
    end

    assert_redirected_to admin_help_path(assigns(:admin_help))
  end

  test "should show admin_help" do
    get :show, id: @admin_help
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_help
    assert_response :success
  end

  test "should update admin_help" do
    patch :update, id: @admin_help, admin_help: { e_mail: @admin_help.e_mail, full_name: @admin_help.full_name, help: @admin_help.help }
    assert_redirected_to admin_help_path(assigns(:admin_help))
  end

  test "should destroy admin_help" do
    assert_difference('Admin::Help.count', -1) do
      delete :destroy, id: @admin_help
    end

    assert_redirected_to admin_helps_path
  end
end
