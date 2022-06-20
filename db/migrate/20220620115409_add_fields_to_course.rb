class AddFieldsToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :language, :integer
    add_column :courses, :level, :integer
  end
end
