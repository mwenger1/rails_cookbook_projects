json.array!(@recipes) do |recipe|
  json.extract! recipe, :title, :food_preference_id, :food_type, :cuisine_id, :servings, :cooking_time, :level_of_difficulty, :ingredients, :procedure
  json.url recipe_url(recipe, format: :json)
end
