json.array!(@admin_advertises) do |admin_advertise|
  json.extract! admin_advertise, :id, :image, :status
  json.url admin_advertise_url(admin_advertise, format: :json)
end
