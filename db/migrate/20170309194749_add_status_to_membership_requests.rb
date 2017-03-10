class AddStatusToMembershipRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :membership_requests, :status, :string
  end
end
