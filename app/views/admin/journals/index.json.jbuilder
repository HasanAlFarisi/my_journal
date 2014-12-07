json.array!(@admin_journals) do |admin_journal|
  json.extract! admin_journal, :id, :title, :start, :end
  json.url admin_journal_url(admin_journal, format: :json)
end
