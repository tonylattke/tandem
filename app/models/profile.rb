class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
end
