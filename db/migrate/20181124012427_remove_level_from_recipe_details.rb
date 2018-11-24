class RemoveLevelFromRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipe_details, :level, :integer
  end
end
