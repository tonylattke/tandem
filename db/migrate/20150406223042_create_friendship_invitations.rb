class CreateFriendshipInvitations < ActiveRecord::Migration
  def change
    create_table :friendship_invitations do |t|
      t.references :sender
      t.references :recipient
    end

    #add_index(:friendship_invitations, [ :sender, :recipient ], unique: true, name: 'by_sender_and_recipient')
  end
end