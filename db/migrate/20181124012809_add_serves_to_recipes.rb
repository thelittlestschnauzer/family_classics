class AddServesToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serves, :string
  end
end
