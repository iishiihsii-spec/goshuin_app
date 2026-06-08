class CreateGoshuins < ActiveRecord::Migration[7.1]
  def change
    create_table :goshuins do |t|
      t.string :place_name, null: false
      t.date :visited_date, null: false
      t.integer :category_id, null: false
      t.text :memo
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
