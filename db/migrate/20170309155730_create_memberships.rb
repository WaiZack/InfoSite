class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
