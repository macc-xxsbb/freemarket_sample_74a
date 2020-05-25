class CreditCard < ApplicationRecord
  belongs_to :user

  validates :card_number, :card_year, :card_month, :security_cord, presence: true
  validates :card_number, :security_code, numericality: { only_integer: true }
  validates :card_number, length: { is: 16 }
  validates :security_code, length: { in: 3..4 }

end
