class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX } 
  validates :password, confirmation: true, presence: true, length: { minimum: 7 }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthdate, presence: true
  validates :phone, presence: true, length: { in: 10..11 }

  has_one :address
  has_one :credit_card, dependent: :destroy

  has_many :credits
  has_many :items
  has_many :comments

  has_many :buyed_items, foreign_key: "buyer_id"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id"

end
