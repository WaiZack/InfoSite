class Team < ApplicationRecord

  include DocumentUploader[:proposal]

  has_many :submissions
  has_many :memberships
  has_many :users, through: :memberships
  has_many :recruits

  validates :name, presence:true, length:{maximum: 50},
            uniqueness: { case_sensitive: false , :message => 'Someone else took this name!'}
  validates :track, presence:true
end
