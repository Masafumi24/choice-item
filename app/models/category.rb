class Category < ApplicationRecord
  has_many :items
  has_ancestry

  def self.category_parent_get(category_array)
    Category.where(ancestry: nil).each{ |parent| category_array << parent.name }
  end

end
