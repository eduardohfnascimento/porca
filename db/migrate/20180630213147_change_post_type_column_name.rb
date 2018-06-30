class ChangePostTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :material_type
  end
end
