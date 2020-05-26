class Shipping < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ship_base
  
  belongs_to :item, optional: true
  validates :ship_base, presence: true
  validates :region, presence: true
  validates :ship_date, presence: true
  validates :prefecture_id, presence: true

end
