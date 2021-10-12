class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :introduction, null: false
      t.text :body, null: false
      t.integer :image_id, null: false
      t.timestamps
    end
  end
end
