class AddDirectionsToRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_details, :directions, :text
  end
end
