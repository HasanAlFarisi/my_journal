json.array!(@admin_helps) do |admin_help|
  json.extract! admin_help, :id, :full_name, :e_mail, :help
  json.url admin_help_url(admin_help, format: :json)
end
