# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all entries..."

Location.destroy_all
User.destroy_all
Twist.destroy_all

puts "Creating Locations..."

argentina = Location.create!(place: 'Argentina')
switzerland = Location.create!(place: 'Switzerland')
california = Location.create!(place: 'California')
england = Location.create!(place: 'England')
new_york = Location.create!(place: 'New York')
massachusetts = Location.create!(place: 'Massachusetts')
los_angeles = Location.create!(place: 'Los Angeles')
san_jose = Location.create!(place: 'San Jose')

puts "Creating Users..."

david = User.create!(username: 'David', location: massachusetts, password: "starwars")
mashu = User.create!(username: 'Mashu', location: argentina, password: "starwars")
tommy = User.create!(username: 'Tommy', location: argentina, password: "starwars")
matthias = User.create!(username: 'Matthias', location: switzerland, password: "starwars")
oliver = User.create!(username: 'Oliver', location: england, password: "starwars")
simcha = User.create!(username: 'Simcha', location: new_york, password: "starwars")
abby = User.create!(username: 'Abby', location: los_angeles, password: "starwars")
brian = User.create!(username: 'Brian', location: san_jose, password: "starwars")

puts "Creating Twists..."

Twist.create!(body: 'Right foot, blue', author: david)
Twist.create!(body: 'Left foot, yellow', author: mashu)
Twist.create!(body: 'Right hand, red', author: tommy)
Twist.create!(body: 'Left hand, orange', author: matthias)
Twist.create!(body: 'Left elbow, blue', author: oliver)
Twist.create!(body: 'Right toes, red', author: simcha)
Twist.create!(body: 'Left knee, yellow', author: abby)
Twist.create!(body: 'Right shoulder, orange', author: brian)
Twist.create!(body: 'Left elbow, yellow', author: mashu)
Twist.create!(body: 'Right hand, orange', author: oliver)
Twist.create!(body: 'Left fingers, red', author: matthias)
Twist.create!(body: 'Left foot, red', author: brian)
Twist.create!(body: 'Right foot, yellow', author: abby)
Twist.create!(body: 'Left hand, blue', author: tommy)

puts "Finished"