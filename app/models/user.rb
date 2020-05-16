class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name ,presence: true
  has_one :address
  has_one :credit_card, dependent: :destroy

         has_many :credits
         has_many :items
         has_many :comments
         
end
