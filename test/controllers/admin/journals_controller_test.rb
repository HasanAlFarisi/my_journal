require 'test_helper'

class Admin::JournalsControllerTest < ActionController::TestCase
  setup do
    @admin_journal = admin_journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_journal" do
    assert_difference('Admin::Journal.count') do
      post :create, admin_journal: { end: @admin_journal.end, start: @admin_journal.start, title: @admin_journal.title }
    end

    assert_redirected_to admin_journal_path(assigns(:admin_journal))
  end

  test "should show admin_journal" do
    get :show, id: @admin_journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_journal
    assert_response :success
  end

  test "should update admin_journal" do
    patch :update, id: @admin_journal, admin_journal: { end: @admin_journal.end, start: @admin_journal.start, title: @admin_journal.title }
    assert_redirected_to admin_journal_path(assigns(:admin_journal))
  end

  test "should destroy admin_journal" do
    assert_difference('Admin::Journal.count', -1) do
      delete :destroy, id: @admin_journal
    end

    assert_redirected_to admin_journals_path
  end
end
