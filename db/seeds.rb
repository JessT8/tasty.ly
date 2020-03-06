# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(email: 'admin@test', password: 'password', password_confirmation: 'password')
user1 = User.new({email: FFaker::Internet.email, password: 'password', password_confirmation: 'password'})
user1.save
user2 = User.new({email: FFaker::Internet.email, password: 'password', password_confirmation: 'password'})
user2.save
user3 = User.new({email: FFaker::Internet.email, password: 'password', password_confirmation: 'password'})
user3.save
owner = Owner.create(email: 'admin@test', password: 'password', password_confirmation: 'password' );
10.times {
   restaurant = Restaurant.create(name: FFaker::Company.name, image_url: FFaker::Image.url, owner_id: owner.id)
   10.times {
    food = Food.create(name: FFaker::Food.meat, restaurant_id: restaurant.id)
    food.users << admin
   }
   restaurant.users << admin
}