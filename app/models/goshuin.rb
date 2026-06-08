class Goshuin < ApplicationRecord

  # バリデーション
  validates :place_name, presence: true
  validates :visited_date, presence: true
  validates :category_id, presence: true
  # アソシエーション
  belongs_to :user
end
