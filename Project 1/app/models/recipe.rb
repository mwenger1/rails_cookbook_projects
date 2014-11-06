class Recipe < ActiveRecord::Base

  #associations
  belongs_to :food_preference
  belongs_to :food_type
  belongs_to :cuisine

DIFFICULTY = [
              "Easy" ,
              "Medium" ,
              "Hard"
  ]
end
