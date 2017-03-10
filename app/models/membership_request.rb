class MembershipRequest < ApplicationRecord
  belongs_to :user

  validates :requester_id,
            uniqueness: { scope: :team_id }
end
