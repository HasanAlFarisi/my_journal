require 'test_helper'

class Admin::JournalIssuesControllerTest < ActionController::TestCase
  setup do
    @admin_journal_issue = admin_journal_issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_journal_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_journal_issue" do
    assert_difference('Admin::JournalIssue.count') do
      post :create, admin_journal_issue: { end: @admin_journal_issue.end, journal_id: @admin_journal_issue.journal_id, no: @admin_journal_issue.no, start: @admin_journal_issue.start, status: @admin_journal_issue.status, title: @admin_journal_issue.title }
    end

    assert_redirected_to admin_journal_issue_path(assigns(:admin_journal_issue))
  end

  test "should show admin_journal_issue" do
    get :show, id: @admin_journal_issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_journal_issue
    assert_response :success
  end

  test "should update admin_journal_issue" do
    patch :update, id: @admin_journal_issue, admin_journal_issue: { end: @admin_journal_issue.end, journal_id: @admin_journal_issue.journal_id, no: @admin_journal_issue.no, start: @admin_journal_issue.start, status: @admin_journal_issue.status, title: @admin_journal_issue.title }
    assert_redirected_to admin_journal_issue_path(assigns(:admin_journal_issue))
  end

  test "should destroy admin_journal_issue" do
    assert_difference('Admin::JournalIssue.count', -1) do
      delete :destroy, id: @admin_journal_issue
    end

    assert_redirected_to admin_journal_issues_path
  end
end
