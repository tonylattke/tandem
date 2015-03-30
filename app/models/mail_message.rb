class MailMessage < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  validates :text, :presence => true, :length => { :minimum => 1 }

  default_scope { order('created_at DESC') }	
end
