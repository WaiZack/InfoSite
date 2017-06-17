class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|

      t.string :name
      t.string :email
      t.string :phone
      t.string :choice


      t.timestamps
    end
  end
end
