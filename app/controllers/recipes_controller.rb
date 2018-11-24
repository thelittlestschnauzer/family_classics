class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    
    def new 
      @recipe = Recipe.new 
      @recipe.ingredients.build
      @recipe.build_category
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

    def update 
      @recipe.update(recipe_params) 
      redirect_to recipe_path(@recipe) 
    end
    
    def destroy 
      @recipe.destroy
      redirect_to root_path
    end 

    private 

    def recipe_params 
      params.require(:recipe).permit(:title, :image, :level, :serves, ingredients_attributes: [:name, recipe_details: [:quantity]])
    end 

    def set_recipe 
      @recipe = Recipe.find(params[:id])
    end 
end
