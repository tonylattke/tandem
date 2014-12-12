class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.references :message, index: true

      t.timestamps
    end
  end
end
