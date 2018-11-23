class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    
    def new 
      @recipe = Recipe.new 
      @recipe.ingredients.build
    end 

    def create 
      @recipe = Recipe.create(recipe_params)
      if @recipe.save 
        redirect_to @recipe
      else
        render :new 
      end 
    end 

    def index 
      @recipes = Recipe.with_attached_image
    end 

    def show 
    end 

    private 

    def recipe_params 
      params.require(:recipe).permit(:title, :image, ingredients_attributes: [:name, recipe_details: [:serves, :quantity, :level]])
    end 

    def set_recipe 
      @recipe = Recipe.find(params[:id])
    end 
end
