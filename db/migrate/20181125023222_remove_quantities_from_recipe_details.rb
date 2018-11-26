class RemoveQuantitiesFromRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipe_details, :quantities, :string
  end
end
