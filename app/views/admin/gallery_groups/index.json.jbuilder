json.array!(@admin_gallery_groups) do |admin_gallery_group|
  json.extract! admin_gallery_group, :id, :name, :sub_name
  json.url admin_gallery_group_url(admin_gallery_group, format: :json)
end
