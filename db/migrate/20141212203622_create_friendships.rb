class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :sender
      t.references :recipient
      t.boolean :tandem

      t.timestamps
    end
  end
end
