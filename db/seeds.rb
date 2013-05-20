# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create({ name: 'andrew', email: 'test@test.com', password: 'pass123', password_confirmation: 'pass123', confirmed_at: Time.now })
task = Task.create({ name: 'My first task', completed: false, user: user })
task = Task.create({ name: 'My second task', completed: true, user: user })