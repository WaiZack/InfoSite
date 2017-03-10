class CreateMembershipRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :membership_requests do |t|
      t.integer :requester_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
