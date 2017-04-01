class AddNricToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nric, :string
  end
end
