json.array!(@articles) do |article|
  json.extract! article, :id, :title, :body, :comment_id
  json.url article_url(article, format: :json)
end
