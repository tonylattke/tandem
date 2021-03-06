class Profile < ActiveRecord::Base
  
  extend FriendlyId

  friendly_id :nickname, use: :slugged

  belongs_to :user
  belongs_to :language

  has_attached_file :photo, :styles => { :small => "168x168>" },
    :url  => "/assets/profiles/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']

  validates :telf, format: { with: /\d{4}-\d{3}-\d{4}/, message: "Wrong format. You must use XXXX-XXX-XXXX" }

  def to_s
    return "#{@nickname}"
  end

  def should_generate_new_friendly_id?
    nickname_changed?
  end
end
