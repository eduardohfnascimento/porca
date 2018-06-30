class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :link
      t.string :semester
      t.string :type
      t.references :professor, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
