class MailingList < ApplicationRecord
  validates :email, :email_format => { :message => 'This email is not looking valid' }, presence:true, length: { maximum: 255 },
      uniqueness: { case_sensitive: false , :message => 'You have already signed up!'}
end
