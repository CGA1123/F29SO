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

# Morty Smith Jr
User.create!(
  email: 'mortyjr@earth-c137.local',
  password: '12345678',
  password_confirmation: '12345678',
  groups: Group.where(name: 'human'),
  confirmed_at: Time.now,
  first_name: 'Morty Jr',
  last_name: 'Smith',
  location: Location.find_by(name: 'Earth') )

# Jerry Smith
User.create!(
    email: 'jerry@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Jerryboree',
    last_name: 'Smith',
    location: Location.find_by(name: 'Jerryboree') )

# Hulk Hogan
User.create!(
    email: 'hulkhogan@hulkamania-19.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Hulk',
    last_name: 'Hogan',
    location: Location.find_by(name: 'Earth') )

#Sterling Archer
User.create!(
    email: 'archer@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Sterling',
    last_name: 'Archer',
    location: Location.find_by(name: 'Earth') )

# Kyle Reese
User.create!(
    email: 'kyle@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Kyle',
    last_name: 'Reese',
    location: Location.find_by(name: 'Earth') )

#Principal Vagina
User.create!(
    email: 'principal@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Principal',
    last_name: 'Vagina',
    location: Location.find_by(name: 'Mars') )

# Scary Terry
User.create!(
    email: 'scary@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Principal',
    last_name: 'Vagina',
    location: Location.find_by(name: 'Mars') )

#Douglas Quaid
User.create!(
    email: 'douglas@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Douglas',
    last_name: 'Quaid',
    location: Location.find_by(name: 'Mars') )


#Vin Diesel
User.create!(
    email: 'vin@earth.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Vin',
    last_name: 'Diesel',
    location: Location.find_by(name: 'Mars') )


 #Tom Cruise
 User.create!(
     email: 'tom@pluto.local',
     password: '12345678',
     password_confirmation: '12345678',
     groups: Group.where(name: 'human'),
     confirmed_at: Time.now,
     first_name: 'Tom',
     last_name: 'Cruise',
     location: Location.find_by(name: 'Pluto') )


#Harry Potter
User.create!(
    email: 'harry@earth.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Douglas',
    last_name: 'Quaid',
    location: Location.find_by(name: 'Mars') )

#Bruce Wayne
User.create!(
    email: 'batman@earth.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Bruce',
    last_name: 'Wayne',
    location: Location.find_by(name: 'Earth') )

#Clark Kent
User.create!(
    email: 'superman@earth.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Clark',
    last_name: 'Kent',
    location: Location.find_by(name: 'Krypton') )

# Luke Skywalker
User.create!(
    email: 'luke@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Luke',
    last_name: 'Skywalker',
    location: Location.find_by(name: 'Saturn') )

# Ellen Ripley
  User.create!(
      email: 'ellen@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Ellen',
      last_name: 'Ripley',
      location: Location.find_by(name: 'Mars') )

  # Tom Ripley
  User.create!(
      email: 'tom@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Tom',
      last_name: 'Ripley',
      location: Location.find_by(name: 'Venice') )

  # Tony Stark
  User.create!(
      email: 'tony@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Tony',
      last_name: 'Stark',
      location: Location.find_by(name: 'New York') )

  #Barry Allen
  User.create!(
      email: 'ba@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Barry',
      last_name: 'Allen',
      location: Location.find_by(name: 'New York') )

  #Donald Trump
  User.create!(
      email: 'trump@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Donald',
      last_name: 'Trump',
      location: Location.find_by(name: 'Saturn') )

  #Elvis Presley
  User.create!(
      email: 'elvis@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Elvis',
      last_name: 'Presley',
      location: Location.find_by(name: 'Dallas') )

  # John Hammond
  User.create!(
      email: 'hammond@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'John',
      last_name: 'Hammond',
      location: Location.find_by(name: 'Seattle') )

  # Frodo Baggins
  User.create!(
      email: 'frodo@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Frodo',
      last_name: 'Baggins',
      location: Location.find_by(name: 'Shire') )

  # Bilbo Baggins
  User.create!(
      email: 'bilbo@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Bilbo',
      last_name: 'Baggins',
      location: Location.find_by(name: 'Shire') )

  # Master Chief
  User.create!(
      email: 'chief@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Master',
      last_name: 'Chief',
      location: Location.find_by(name: 'Shire') )

  # Harry Lime
  User.create!(
      email: 'lime@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Harry',
      last_name: 'Lime',
      location: Location.find_by(name: 'Madrid') )

  # Peter Parker
  User.create!(
      email: 'spiderman@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Peter',
      last_name: 'Parker',
      location: Location.find_by(name: 'New York') )

  # George Clooney
  User.create!(
      email: 'clooney@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'George',
      last_name: 'Clooney',
      location: Location.find_by(name: 'Istanbul') )

  # Hannibal Lector
  User.create!(
      email: 'hannibal@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Hannibal',
      last_name: 'Lector',
      location: Location.find_by(name: 'Rome') )

  # Walter White
  User.create!(
      email: 'walter@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Walter',
      last_name: 'White',
      location: Location.find_by(name: 'Seattle') )

  # John McClane
  User.create!(
      email: 'diehard@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'John',
      last_name: 'McClane',
      location: Location.find_by(name: 'Chicago') )

  # Snake Plissken
  User.create!(
      email: 'snake@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Snake',
      last_name: 'Plissken',
      location: Location.find_by(name: 'New York') )

  # Wayne Campbell
  User.create!(
      email: 'wayne@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Wayne',
      last_name: 'Campbell',
      location: Location.find_by(name: 'Vancouver') )

  # Frasier Crane
  User.create!(
      email: 'crane@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Frasier',
      last_name: 'Crane',
      location: Location.find_by(name: 'Seattle') )

  # Brendan Rodgers
  User.create!(
      email: 'brendan@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Brendan',
      last_name: 'Rodgers',
      location: Location.find_by(name: 'Glasgow') )

   # Alex Murphy
   User.create!(
       email: 'murphy@earth.local',
       password: '12345678',
       password_confirmation: '12345678',
       groups: Group.where(name: 'human'),
       confirmed_at: Time.now,
       first_name: 'Alex',
       last_name: 'Murphy',
       location: Location.find_by(name: 'Detroit') )
