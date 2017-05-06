class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :institute
      t.integer :phone
      t.string :year``
      t.string :specialization
      t.text :introduction

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
