json.array!(@admin_journal_issues) do |admin_journal_issue|
  json.extract! admin_journal_issue, :id, :journal_id, :status, :no, :title, :start, :end
  json.url admin_journal_issue_url(admin_journal_issue, format: :json)
end
