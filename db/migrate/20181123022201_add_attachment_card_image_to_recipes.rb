class AddAttachmentCardImageToRecipes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :card_image
    end
  end

  def self.down
    remove_attachment :recipes, :card_image
  end
end
