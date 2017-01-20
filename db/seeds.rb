# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Root Group
root = Group.create!(name: 'root', description: 'super user group, this group has all permissions on the system.')
location = Location.create!(name: 'Earth')
User.create!(email: 'admin@reaf-rms.local', password: '12345678', password_confirmation: '12345678', groups: [root], confirmed_at: Time.now, first_name: 'Admin', last_name: 'User', location: location)
ProjectType.create!(name: 'Type', description: 'Example Project Type')
