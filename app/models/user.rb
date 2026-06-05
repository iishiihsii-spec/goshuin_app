class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # バリデーション
  validates :nickname, presence: true

  # アソシエーション
  # has_many :goshuins
  # has_many :user_stamps
  # has_many :stamps, through: :user_stamps

end
