class RemoveLevelOfDifficultyFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :level_of_difficulty, :string
  end
end
