# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
Review.destroy_all

50.times.each do
  i=Idea.create(
    title: Faker::ProgrammingLanguage.name,
    description: Faker::Lorem.paragraph
  )
  if i.valid?
    rand(0..10).times.each do
      Review.create(
        body: Faker::Seinfeld.quote,
        idea: i
      )
    end
  end
end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say "Created #{ideas.count} ideas", :frogs
puts Cowsay.say "Created #{reviews.count} reviews", :sheep
