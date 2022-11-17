# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Weights", "Swimming", "Running", "HIIT"]

if Category.all.length == 0
    categories.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
    end
end

if User.count == 0
    User.create(username: "steve", name: "Steve", email: "steve@test.com", password: "password", password_confirmation: "password")
    User.create(username: "casper", name: "Casper", email: "casper@test.com", password: "password", password_confirmation: "password")
end

if Workout.all.length == 0
    Workout.create(user_id: 1, category_id: 1, description: "Barbell Bench Press", weight: "100kg", reps: "10", date: "2022-11-08")
    Workout.create(user_id: 1, category_id: 2, description: "Main beach to Surfers Paradise", date: "2022-11-06", distance: "6km", time: "33 mins")
    Workout.create(user_id: 2, category_id: 4, description: "Full body workout", time: "30 mins", date: "2022-11-08", avg_bpm: "160")
    Workout.create(user_id: 2, category_id: 3, description: "800m", date: "2022-11-5", distance: "800m", time: "3 mins")
end