user = User.create!(email: "francescojjmari@gmail.com", password: "francesco")
Project.create!(name: "Build the Cabin", user: user)
Project.create!(name: "Plan the picnic", user: user)
Project.create!(name: "Arrange trip to LA", user: user)

30.times do
  Task.create!(project_id: rand(1..3), content: Faker::Food.ingredient)
end
