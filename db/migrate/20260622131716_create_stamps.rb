class CreateStamps < ActiveRecord::Migration[7.1]
  def change
    create_table :stamps do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :rarity_id, null: false
      t.string :icon, null: false
      t.timestamps
    end
  end
end
