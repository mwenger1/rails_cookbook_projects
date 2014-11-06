class AddDifficultyLevelToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :difficulty_level, :string
  end
end
