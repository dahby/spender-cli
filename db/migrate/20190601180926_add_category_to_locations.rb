class AddCategoryToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :category, :string
  end
end
