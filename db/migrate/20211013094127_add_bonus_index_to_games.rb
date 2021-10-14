class AddBonusIndexToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :bonus_index, :text
  end
end
