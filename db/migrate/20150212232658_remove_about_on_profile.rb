class RemoveAboutOnProfile < ActiveRecord::Migration
  def change
  	remove_column :profiles, :about
  end
end
