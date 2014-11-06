class AddOrganizationIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :organization_id, :integer
  end
end
