# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Start seed the database!"
(1..5).each do |i|
  group = Group.create(title: "fake title #{i}", description: "fake description #{i}")
  (1..3).each do |j|
    group.posts.create(content: "fake content #{j}");
  end
end