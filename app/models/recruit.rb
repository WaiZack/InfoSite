class Recruit < ApplicationRecord

  validates :team_id, presence:true
  validates :content, presence:true
  validates :email, presence:true
end
