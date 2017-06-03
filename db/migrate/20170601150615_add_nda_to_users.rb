class AddNdaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :NDA, :boolean
  end
end
