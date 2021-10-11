class AddTitleToAdminGames < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_games, :title, :string
    add_column :admin_games, :introduction, :text
    add_column :admin_games, :image_id, :integer
  end
end
