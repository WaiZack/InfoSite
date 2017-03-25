class AddAcademicLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :academic_level, :string
  end
end
