class CreateUserStamps < ActiveRecord::Migration[7.1]
  def change
    create_table :user_stamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stamp, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.timestamps
    end
    add_index :user_stamps, [:user_id, :stamp_id], unique: true
  end
end
