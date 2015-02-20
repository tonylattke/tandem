class RemoveMessageOnCountry < ActiveRecord::Migration
  def change
    remove_column :countries, :message_id
  end
end
