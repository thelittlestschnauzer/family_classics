class Recipe < ApplicationRecord
  has_one_attached :image
  validate :image_type
  
  belongs_to :category, optional: true

  has_many :recipe_details 
  has_many :ingredients, through: :recipe_details
  
  validates :title, presence: true
  validates :title, uniqueness: true 
  validates_associated :ingredients
  
  def thumbnail 
    return self.image.variant(resize: '350x350!').processed
  end 

  def large 
    return self.image.variant(resize: '1000x500!').processed
  end 

  private 

  def image_type
    if image.attached? == false 
      errors.add(:image, "is missing")
    end  
  end 

  def ingredients_attributes=(ingredients_attributes) 
    ingredients_attributes.values.each do |ingredients_attribute|
      if !ingredients_attribute["name"].empty?
        ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
        self.recipe_details.build(recipe: self, ingredient: ingredient, serves: ingredients_attribute["recipe_details"]["serves"], level: ingredients_attribute["recipe_details"]["level"], quantity: ingredients_attribute["recipe_details"]["quantity"]) 
      end 
    end 
  end  
end
