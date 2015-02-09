class DeleteTimeFromMailMassage < ActiveRecord::Migration
  def change
  	remove_column :mail_messages, :time
  end
end
