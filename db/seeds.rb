# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({email: 'test@test.com'})
puts 'CREATED ADMIN USER: ' << user.email

PASSWORD = 'pass123'

users = User.create([
  {email: 'js@winterfell.gov', password: PASSWORD},
  {email: 'daeny@dragon.io', password: PASSWORD},
  { email: 'cs@iron.throne', password: PASSWORD}
])

10.times do
  Idea.create title: Faker::GameOfThrones.character,
                  body:  Faker::Hacker.say_something_smart,
                  user: users.sample
end

ideas = Idea.all

ideas.each do |i|
  rand(1..5).times do
    Comment.create(body: Faker::RickAndMorty.quote, idea: i)
  end
end

puts Cowsay.say 'Created 10 ideas', :cow
puts Cowsay.say "Created #{Comment.all.count} answers! ", :ghostbusters
