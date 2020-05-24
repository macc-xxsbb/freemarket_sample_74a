class Brand < ApplicationRecord

  belongs_to :item, optional: true
  
  # validates :brand, presence: true

end
