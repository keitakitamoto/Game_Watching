class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :title, null: false
      t.float :rate, null: false, default: 0
      t.text :introduction

      t.timestamps
    end
  end
end
