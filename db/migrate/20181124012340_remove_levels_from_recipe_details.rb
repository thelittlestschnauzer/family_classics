class RemoveLevelsFromRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipe_details, :levels, :integer
  end
end
