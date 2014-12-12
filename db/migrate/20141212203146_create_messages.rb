class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :language
      t.string :text

      t.timestamps
    end
  end
end