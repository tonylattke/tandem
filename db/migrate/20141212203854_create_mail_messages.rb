class CreateMailMessages < ActiveRecord::Migration
  def change
    create_table :mail_messages do |t|
      t.references :sender
      t.references :recipient
      t.text :text
      t.time :time

      t.timestamps
    end
  end
end
