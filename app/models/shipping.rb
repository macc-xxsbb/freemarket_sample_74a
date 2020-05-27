class Shipping < ApplicationRecord
  belongs_to :ship_date
  belongs_to :item, optional: true
  validates :prefecture_id, presence: true
  
end
