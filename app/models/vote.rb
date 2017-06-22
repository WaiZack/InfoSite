class Vote < ApplicationRecord

  validates :name, :choice, presence: true

  validates :phone, presence: true, uniqueness: { case_sensitive: false , :message => 'You have already voted!'}
  validates :email, :email_format => { :message => 'is not looking valid' }, presence:true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false , :message => 'this account already exists'}

end
