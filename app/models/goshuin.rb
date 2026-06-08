class Goshuin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # バリデーション
  validates :place_name, presence: true
  validates :visited_date, presence: true
  validates :category_id, , numericality: { other_than: 1 , message: "を選択してください" }

  # アソシエーション
  belongs_to :user
  belongs_to :category
end
