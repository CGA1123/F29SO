# Users

# root user
User.create!(
  email: 'admin@reaf-rms.local',
  password: '12345678',
  password_confirmation: '12345678',
  groups: Group.where(name: 'root'),
  confirmed_at: Time.now,
  first_name: 'Admin',
  last_name: 'User',
  location: Location.find_by(name: 'Earth') )

# Rick Sanchez
User.create!(
  email: 'rick@earth-c137.local',
  password: '12345678',
  password_confirmation: '12345678',
  groups: Group.where(name: 'scientist'),
  confirmed_at: Time.now,
  first_name: 'Rick',
  last_name: 'Sanchez',
  location: Location.find_by(name: 'Earth') )

# Morty Smith
User.create!(
  email: 'morty@earth-c137.local',
  password: '12345678',
  password_confirmation: '12345678',
  groups: Group.where(name: 'human'),
  confirmed_at: Time.now,
  first_name: 'Morty',
  last_name: 'Smith',
  location: Location.find_by(name: 'Earth') )
