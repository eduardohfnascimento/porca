class AddAliasToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :alias, :string
  end
end
