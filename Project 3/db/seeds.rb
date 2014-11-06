# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
75.times do
  Pin.create(
    :name => "I love to Paneer",
    :image => "paneer-butter-masala5.jpg",
    :board_id => 1
  )
end
