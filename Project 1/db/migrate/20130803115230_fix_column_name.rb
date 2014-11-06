class FixColumnName < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
     t.rename :food_type, :food_type_id
    end
  end
end
