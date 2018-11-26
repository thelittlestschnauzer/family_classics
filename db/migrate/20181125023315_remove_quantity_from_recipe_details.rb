class RemoveQuantityFromRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipe_details, :quantity, :string
  end
end
