class Goshuin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :user
  belongs_to :category

  # バリデーション
  validates :place_name, presence: true
  validates :visited_date, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください" }

end
