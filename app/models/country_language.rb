class CountryLanguage < ActiveRecord::Base
  belongs_to :country
  belongs_to :language
end
