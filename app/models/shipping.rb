class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ship_base
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date

  belongs_to :item, optional: true
  validates :prefecture_id, presence: true

end
