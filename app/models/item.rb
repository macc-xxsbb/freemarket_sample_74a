class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  belongs_to :shipping, optional: true
  accepts_nested_attributes_for :shipping, allow_destroy: true
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments
  belongs_to                    :saler,       optional: true
  belongs_to                    :buyer,       optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :prefecture

  validates :item_name, presence: true
  validates :item_images, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :content, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :status_id, presence: true



end
