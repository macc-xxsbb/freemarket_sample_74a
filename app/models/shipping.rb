class Shipping < ApplicationRecord

  belongs_to :item, optional: true
  validates :ship_base, :ship_method, :ship_date, :item_id, :prefecture_id, presence: true
  
end
