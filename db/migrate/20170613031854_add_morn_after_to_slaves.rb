class AddMornAfterToSlaves < ActiveRecord::Migration[5.0]
  def change
    add_column :slaves, :morning, :boolean
    add_column :slaves, :afternoon, :boolean
  end
end
