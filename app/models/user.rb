class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sent_mail_messages, :class_name => 'MailMessage', :foreign_key => 'sender_id'
  has_many :received_mail_messages, :class_name => 'MailMessage', :foreign_key => 'recipient_id'

  has_many :sent_friendships, :class_name => 'Friendship', :foreign_key => 'sender_id'
  has_many :received_friendships, :class_name => 'Friendship', :foreign_key => 'recipient_id'
end

def admin?
    admin
end