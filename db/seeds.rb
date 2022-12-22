# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 10.times do
  user  = User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, about: Faker::Lorem.sentences, password_digest: "12345")
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.sentences, is_publish: Faker::Boolean.boolean, user: user)
  tag = Tag.create(name: Faker::Name.name )
  comment = Comment.create(fullname: Faker::Name.name, email: Faker::Internet.email, message: Faker::Lorem.sentences,  status: Faker::Boolean.boolean, post: post)
end