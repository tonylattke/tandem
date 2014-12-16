class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  has_attached_file :photo, :styles => { :small => "168x168>" },
  :url  => "/assets/profile/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
end
