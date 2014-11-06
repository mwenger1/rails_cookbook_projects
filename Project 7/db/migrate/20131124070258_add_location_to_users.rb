class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :avatar, :string
    add_column :users, :oauth_secret, :string
  end
end
