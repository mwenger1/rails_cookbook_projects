class RemoveLatFromFriends < ActiveRecord::Migration
  def change
    remove_column :friends, :lat, :float
    remove_column :friends, :lng, :float
  end
end
