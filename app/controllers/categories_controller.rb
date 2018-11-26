class CategoriesController < ApplicationController
  
  def index 
    @categories = Category.all 
  end 

  def show 
    @recipe = Recipe.new
  end 


end
