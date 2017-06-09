class CreateSlaves < ActiveRecord::Migration[5.0]
  def change
    create_table :slaves do |t|

      t.string :name
      t.string :institute
      t.string :email
      t.string :phone
      t.string :diet

      t.timestamps
    end
  end
end
