class AddEmailAndNameToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :membership_requests, :email, :string
    add_column :membership_requests, :teamName, :string
  end
end
