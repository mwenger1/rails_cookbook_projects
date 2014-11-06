# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# plans = ["Curry", "Dessert", "Sides","Breakfast"]
# plans.each{|d| Plan.where(:name => d).first_or_create}
plans = [
  [ "Small", 1, 10, 20, 5, 10 ],
  [ "Medium", 5, 50, 50, 10, 30 ],
  [ "Large", 10, 100, 50, 50, 50 ]
]

plans.each do |name, restaurants, tables, menu_items, storage, price|
  Plan.create( name: name, restaurants: restaurants, tables:tables, menu_items:menu_items, storage:storage, price:price )
end
