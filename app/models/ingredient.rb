class Ingredient < ApplicationRecord
  has_many :recipe_details
  has_many :recipes, through: :recipes 

  validates :name, presence: true
end
