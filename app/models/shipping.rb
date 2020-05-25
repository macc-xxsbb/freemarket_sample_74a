class Shipping < ApplicationRecord

  belongs_to :item, optional: true
  validates :prefecture_id, presence: true
  
end
