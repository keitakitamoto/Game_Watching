class CreateAdminGames < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_games do |t|

      t.timestamps
    end
  end
end
