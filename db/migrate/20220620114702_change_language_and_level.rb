class ChangeLanguageAndLevel < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :language, :integer
    remove_column :courses, :level, :integer
  end
end
