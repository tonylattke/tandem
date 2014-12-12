json.array!(@country_languages) do |country_language|
  json.extract! country_language, :id, :country_id, :language_id
  json.url country_language_url(country_language, format: :json)
end
