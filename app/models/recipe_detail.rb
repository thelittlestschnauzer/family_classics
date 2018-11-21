class RecipeDetail < ApplicationRecord
    belongs_to :recipe 
    belongs_to :ingredient 

    validates :serves, :level, :quantity, presence: true
end
