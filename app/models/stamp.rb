class Stamp < ApplicationRecord
  has_many :user_stamps
  has_many :users, through: :user_stamps
  def rarity_name
    case rarity_id
    when 1
      "Normal"
    when 2
      "Rare"
    when 3
      "Super Rare"
    else
      "Ultra Rare"
    end
  end
end
