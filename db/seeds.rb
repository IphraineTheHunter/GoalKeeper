# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'Lily Johansen', email: 'lily.johansen@example.com', password: 'password')
user.recurring_goals.create(name: 'Jog 1 mile', goal_type: 'Daily', completed: true)
user.recurring_goals.create(name: 'Swim for 1 hour', goal_type: 'Weekly', completed: false)
user.recurring_goals.create(name: 'Do endurance run', goal_type: 'Monthly', completed: false)