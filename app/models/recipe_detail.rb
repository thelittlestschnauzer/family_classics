class RecipeDetail < ApplicationRecord
    belongs_to :recipe 
    belongs_to :ingredient 

    validates :directions, presence: true
end
