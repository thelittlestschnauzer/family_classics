class RemoveServesFromRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipe_details, :serves, :integer
  end
end
