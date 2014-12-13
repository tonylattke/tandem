class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :message, index: true
      t.string :time_zone
      t.string :address_representation
      t.integer :code
      t.string :iso_code
    end
  end
end
