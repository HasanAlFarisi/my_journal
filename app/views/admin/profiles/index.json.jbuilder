json.array!(@admin_profiles) do |admin_profile|
  json.extract! admin_profile, :id, :name, :last_name, :facebook, :e-mail, :admin_skill_id, :admin_hobby_id
  json.url admin_profile_url(admin_profile, format: :json)
end
