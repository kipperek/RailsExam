json.array!(@posts) do |post|
  json.extract! post, :id, :content, :date, :owner, :description
  json.url post_url(post, format: :json)
end
