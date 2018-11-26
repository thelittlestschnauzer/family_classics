class Recipe < ApplicationRecord
  has_one_attached :image
  validate :image_type
  
  belongs_to :category
  
  has_many :recipe_details 
  has_many :ingredients, through: :recipe_details

  validates :serves, :level, presence: true
  
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

end
