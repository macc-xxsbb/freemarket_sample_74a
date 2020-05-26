class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item

  validates :image, :item_id, presence: true
  validates_presence_of :item
end
