class AddShirtSizeAndDietToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dietaryPreference, :string
    add_column :users, :shirtSize, :string
  end
end
