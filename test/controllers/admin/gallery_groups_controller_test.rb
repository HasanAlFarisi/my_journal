require 'test_helper'

class Admin::GalleryGroupsControllerTest < ActionController::TestCase
  setup do
    @admin_gallery_group = admin_gallery_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_gallery_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_gallery_group" do
    assert_difference('Admin::GalleryGroup.count') do
      post :create, admin_gallery_group: { name: @admin_gallery_group.name, sub_name: @admin_gallery_group.sub_name }
    end

    assert_redirected_to admin_gallery_group_path(assigns(:admin_gallery_group))
  end

  test "should show admin_gallery_group" do
    get :show, id: @admin_gallery_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_gallery_group
    assert_response :success
  end

  test "should update admin_gallery_group" do
    patch :update, id: @admin_gallery_group, admin_gallery_group: { name: @admin_gallery_group.name, sub_name: @admin_gallery_group.sub_name }
    assert_redirected_to admin_gallery_group_path(assigns(:admin_gallery_group))
  end

  test "should destroy admin_gallery_group" do
    assert_difference('Admin::GalleryGroup.count', -1) do
      delete :destroy, id: @admin_gallery_group
    end

    assert_redirected_to admin_gallery_groups_path
  end
end
