class Team < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence:true, length:{maximum: 50},
            uniqueness: { case_sensitive: false , :message => 'Someone else took this name!'}
  validates :track, presence:true
end
