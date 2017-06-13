class AddMornAfterToSlavesForDay2 < ActiveRecord::Migration[5.0]
  def change
    add_column :slaves, :morning2, :boolean
    add_column :slaves, :afternoon2, :boolean
  end
end
