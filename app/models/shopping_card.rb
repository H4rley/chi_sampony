class ShoppingCard < ApplicationRecord

  has_many :card_items
  has_many :products, through: :card_items

  def group_by_product_id
    card_items.group(:product_id).count
  end  
end
