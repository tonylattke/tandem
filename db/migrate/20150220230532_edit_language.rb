class EditLanguage < ActiveRecord::Migration
  def change
  	remove_column :languages, :message_id
  	add_column :languages, :name, :string
  end
end
