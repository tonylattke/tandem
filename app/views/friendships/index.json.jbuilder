json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :user_id, :user_id, :tandem
  json.url friendship_url(friendship, format: :json)
end
