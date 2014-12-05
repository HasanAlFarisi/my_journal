json.array!(@admin_company_profiles) do |admin_company_profile|
  json.extract! admin_company_profile, :id, :name, :address, :vission, :mission, :motto, :photo
  json.url admin_company_profile_url(admin_company_profile, format: :json)
end
