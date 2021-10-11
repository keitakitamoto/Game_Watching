class AddNameToAdminGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_genres, :name, :string
  end
end
