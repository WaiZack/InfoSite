class AddNameToRecruit < ActiveRecord::Migration[5.0]
  def change
    add_column :recruits, :team_name, :string
  end
end
