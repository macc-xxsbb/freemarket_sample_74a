class Item < ApplicationRecord
  belongs_to :user
  belongs_to :shipping
  has_many :categories
  has_many :brands
  has_many :item_images
  has_many :comments
end
