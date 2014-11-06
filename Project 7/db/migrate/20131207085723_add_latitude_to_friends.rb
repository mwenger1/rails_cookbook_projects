class AddLatitudeToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :latitude, :float, {:precision=>10, :scale=>6}
    add_column :friends, :longitude, :float, {:precision=>10, :scale=>6}
  end
end
