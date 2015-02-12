class AddGenderToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :string, :default => "m", :required => true
  end
end
