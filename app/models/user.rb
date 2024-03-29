class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name, length: { in: 2..20, minimum: 2 }, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
   has_many :favorites, dependent: :destroy

end