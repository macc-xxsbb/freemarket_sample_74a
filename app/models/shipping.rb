class Shipping < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ship_base
  belongs_to :item, optional: true
  validates :prefecture_id, presence: true

  # enum ship_date:{
  #   "選択してください": 0, 
  #   "1日〜2日で発送": 1,
  #   "2日〜3日で発送": 2,
  #   "4日〜7日で発送": 3 
  # }

  # enum ship_base:{
  #   "選択してください": 0, 
  #   "1日〜2日で発送": 1,
  #   "2日〜3日で発送": 2,
  #   "4日〜7日で発送": 3 
  # }

end
