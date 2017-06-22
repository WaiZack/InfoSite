class AddDayToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :day, :string
  end
end
