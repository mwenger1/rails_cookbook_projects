class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :food_preference_id
      t.integer :food_type
      t.integer :cuisine_id
      t.integer :servings
      t.integer :cooking_time
      t.string :level_of_difficulty
      t.text :ingredients
      t.text :procedure

      t.timestamps
    end
  end
end
