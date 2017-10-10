# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "francescojjmari@gmail.com", password: "francesco")
Project.create!(name: "Build the Cabin", user: user)
Project.create!(name: "Plan the picnic", user: user)
Project.create!(name: "Arrange trip to LA", user: user)

30.times do
  Task.create!(project_id: rand(1..3), content: Faker::Food.ingredient)
end
