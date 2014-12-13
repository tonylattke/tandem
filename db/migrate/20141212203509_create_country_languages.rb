class CreateCountryLanguages < ActiveRecord::Migration
  def change
    create_table :country_languages do |t|
      t.references :country, index: true
      t.references :language, index: true
    end
  end
end
