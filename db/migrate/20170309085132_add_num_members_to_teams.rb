class AddNumMembersToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :numMember, :integer
  end
end
