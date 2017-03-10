class AddCreatorToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :creator, :integer
  end
end
