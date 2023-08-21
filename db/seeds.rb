# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Post.destroy_all

puts 'Creating 3 mail users'
tetyana = User.create(
  email: 'tetyana@example.com',
  password: 'password',
  password_confirmation: 'password'
)

nottetyana = User.create(
  email: 'nottetyana@example.com',
  password: 'password',
  password_confirmation: 'password'
)

onemore = User.create(
  email: 'onemore@example.com',
  password: 'password',
  password_confirmation: 'password'
)

tetyana.block(nottetyana)
onemore.block(tetyana)

#Create other 5 users via Faker
puts 'Creating Other Users'
5.times do
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Create 10 posts for each user
puts 'Creating Posts'
User.all.each do |user|
  10.times do
    user.posts.create(
      title: Faker::Lorem.sentence(word_count: 3),
      body: Faker::Lorem.paragraph(sentence_count: 3)
    )
  end
end

# Block random users
puts 'Blocking Users'
User.all.each do |user|
  user.block(User.all.sample)
end