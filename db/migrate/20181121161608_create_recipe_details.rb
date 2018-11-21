class CreateRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_details do |t|
      t.integer :recipe_id
      t.integer :ingredient_id 
      t.string :level 
      t.integer :serves
      t.string :quantity

      
      t.timestamps
    end
  end
end
