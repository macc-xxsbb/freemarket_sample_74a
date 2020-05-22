class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, :birthdate, presence: true

  has_one :address
  has_one :credit_card, dependent: :destroy

  has_many :credits
  has_many :items
  has_many :comments

  has_many :buyed_items, foreign_key: "buyer_id"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id"

end
