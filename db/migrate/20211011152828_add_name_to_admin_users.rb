class AddNameToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :email, :string
  end
end
