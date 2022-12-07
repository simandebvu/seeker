# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding database..."
puts "Creating users..."
User.create(email: "bender@planetexpress.com", password: "123456")

puts "Creating articles..."
Article.create(title: "Futurama", content: "Futurama is an American animated science fiction sitcom created by Matt Groening for the Fox Broadcasting Company. The series follows the adventures of the professional slacker Philip J. Fry, played with a rare blend and skill in making fun outbursts on air, including his rather unusual use or creation as The Planet Express Bot I just wanna see this baby! It looks so real!! Oh man....it has to be like it's made from foam...")

Article.create(title: "Patience", content: "Patience is not the ability to wait, but the ability to keep a good attitude while waiting. One minute of patience, ten years of peace. With love and patience, nothing is impossible. You know that old saying about time flies by? When we think fast enough it doesn't matter what timeline has passed in our past—we can always be sure there's an object down the line for us just like yesterday or today... Or maybe tomorrow. And one day you'll forget everything ever happened since last year... I mean even though everyone seems so happy with their life right now! What kind should they expect when things get really complicated?!")

Article.create(title: "Futurama 2", content: "Futurama 2 is an American animated science fiction sitcom created by Matt Groening for the Fox Broadcasting Company. The series follows the adventures of the professional slacker Philip J. Fry, played with a rare blend and skill in making fun outbursts on air, including his rather unusual use or creation as The Planet Express Bot I just wanna see this baby! It looks so real!! Oh man....it has to be like it's made from foam...")

puts "Seed complete!"