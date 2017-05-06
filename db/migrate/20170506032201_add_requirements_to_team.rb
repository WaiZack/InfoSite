class AddRequirementsToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :requirements, :text
  end
end
