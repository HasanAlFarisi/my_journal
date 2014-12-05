require 'test_helper'

class Dashboard::CommentsControllerTest < ActionController::TestCase
  setup do
    @dashboard_comment = dashboard_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_comment" do
    assert_difference('Dashboard::Comment.count') do
      post :create, dashboard_comment: { article_id: @dashboard_comment.article_id, body: @dashboard_comment.body, email: @dashboard_comment.email, name: @dashboard_comment.name }
    end

    assert_redirected_to dashboard_comment_path(assigns(:dashboard_comment))
  end

  test "should show dashboard_comment" do
    get :show, id: @dashboard_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_comment
    assert_response :success
  end

  test "should update dashboard_comment" do
    patch :update, id: @dashboard_comment, dashboard_comment: { article_id: @dashboard_comment.article_id, body: @dashboard_comment.body, email: @dashboard_comment.email, name: @dashboard_comment.name }
    assert_redirected_to dashboard_comment_path(assigns(:dashboard_comment))
  end

  test "should destroy dashboard_comment" do
    assert_difference('Dashboard::Comment.count', -1) do
      delete :destroy, id: @dashboard_comment
    end

    assert_redirected_to dashboard_comments_path
  end
end
