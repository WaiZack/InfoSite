class Vote < ApplicationRecord

  validates :name, :choice, presence: true

  validates :email, :phone, presence: true, uniqueness: { case_sensitive: false , :message => 'You have already voted!'}
end
