class AddPlanIdToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :plan_id, :integer
  end
end
