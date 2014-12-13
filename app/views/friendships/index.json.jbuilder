json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :sender, :recipient, :tandem
  json.url friendship_url(friendship, format: :json)
end
