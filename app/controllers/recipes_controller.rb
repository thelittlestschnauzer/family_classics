class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    
    def new 
      @recipe = Recipe.new 
      @recipe.ingredients.build
    end 

    def create 
      @recipe = Recipe.create(recipe_params)
      @recipe.image.attach(params[:recipe][:image])
      if @recipe.save 
        redirect_to @recipe 
      else
        render :new 
      end 
    end 

    def show 
    end 

    private 

    def recipe_params 
      params.require(:recipe).permit(:title, ingredients_attributes: [:name, recipe_details: [:serves, :quantity, :level]])
    end 

    def set_recipe 
      @recipe = Recipe.find(params[:id])
    end 
end
