json.array!(@friendship_invitations) do |friendship_invitation|
  json.extract! friendship_invitation, :id, :sender, :recipient
  json.url friendship_invitation_url(friendship_invitation, format: :json)
end
