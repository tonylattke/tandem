json.array!(@countries) do |country|
  json.extract! country, :id, :message_id, :time_zone, :address_representation, :code, :iso_code
  json.url country_url(country, format: :json)
end
