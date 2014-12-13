json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :nickname, :name, :lastname, :language_id, :song, :telf, :birthdate, :about, :question, :answer
  json.url profile_url(profile, format: :json)
end
