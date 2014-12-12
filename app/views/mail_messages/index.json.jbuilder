json.array!(@mail_messages) do |mail_message|
  json.extract! mail_message, :id, :user_id, :user_id, :text, :time
  json.url mail_message_url(mail_message, format: :json)
end
