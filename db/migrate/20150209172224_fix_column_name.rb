class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :profile, :show, :about
  end
end
