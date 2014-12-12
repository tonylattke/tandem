class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :nickname
      t.string :name
      t.string :lastname
      t.references :language, index: true
      t.string :song
      t.string :telf
      t.date :birthdate
      t.string :show
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
