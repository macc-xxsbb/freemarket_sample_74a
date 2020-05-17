class Item < ApplicationRecord
  belongs_to                    :user,       optional: true
  belongs_to                    :category,   optional: true
  has_many                      :brands
  accepts_nested_attributes_for :brands,     allow_destroy: true
  has_many                      :shippings
  accepts_nested_attributes_for :shippings,  allow_destroy: true
  has_many                      :item_images
  accepts_nested_attributes_for :item_images,allow_destroy: true
  has_many                      :comments
end
