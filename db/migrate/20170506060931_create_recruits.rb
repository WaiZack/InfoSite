class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.belongs_to :team, index:true
      t.string :email
      t.text :content
      t.timestamps
    end
  end
end
