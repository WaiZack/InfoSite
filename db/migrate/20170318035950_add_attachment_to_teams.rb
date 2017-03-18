class AddAttachmentToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :proposal_data, :text
  end
end
