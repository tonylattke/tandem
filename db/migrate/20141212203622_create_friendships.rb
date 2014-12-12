class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.references :user, index: true
      t.boolean :tandem

      t.timestamps
    end
  end
end