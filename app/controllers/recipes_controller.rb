class RecipesController < ApplicationController
    
  def new
    @category = Category.find(params[:category_id]) 
    @recipe = @category.recipes.new
  end 

  def create 
    @category = Category.find(params[:category_id])
    @recipe = @category.recipes.create(recipe_params)

    if @recipe.save 
      redirect_to root_path 
    else 
      render :new 
    end 
  end 
    
    private 

    def recipe_params
      params.require(:recipe).permit(:title, :level, :serves, :image)
    end 
    
end
