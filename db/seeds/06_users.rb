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
  groups: Group.where(name: 'Marketing'),
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
    groups: Group.where(name: 'Marketing'),
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

# Scary Terry
User.create!(
    email: 'scary@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Scary',
    last_name: 'Terry',
    location: Location.find_by(name: 'Mars') )

#Douglas Quaid
User.create!(
    email: 'douglas@earth-c137.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'Marketing'),
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
    groups: Group.where(name: 'Marketing'),
    confirmed_at: Time.now,
    first_name: 'Harry',
    last_name: 'Potter',
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
    groups: Group.where(name: 'Marketing'),
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
      groups: Group.where(name: 'IT'),
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
      groups: Group.where(name: 'Data Scientist'),
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
      groups: Group.where(name: 'Data Scientist'),
      confirmed_at: Time.now,
      first_name: 'John',
      last_name: 'Hammond',
      location: Location.find_by(name: 'Seattle') )

  # Frodo Baggins
  User.create!(
      email: 'frodo@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Marketing'),
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
      groups: Group.where(name: 'Project Manager'),
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
      groups: Group.where(name: 'HR'),
      confirmed_at: Time.now,
      first_name: 'George',
      last_name: 'Clooney',
      location: Location.find_by(name: 'Istanbul') )

  # Hannibal Lector
  User.create!(
      email: 'hannibal@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Data Scientist'),
      confirmed_at: Time.now,
      first_name: 'Hannibal',
      last_name: 'Lector',
      location: Location.find_by(name: 'Rome') )

  # Walter White
  User.create!(
      email: 'walter@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Marketing'),
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
       groups: Group.where(name: 'Data Scientist'),
       confirmed_at: Time.now,
       first_name: 'Alex',
       last_name: 'Murphy',
       location: Location.find_by(name: 'Detroit') )

  User.create!(
      email: 'snow@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Jon',
      last_name: 'Snow',
      location: Location.find_by(name: 'London') )

  User.create!(
      email: 'ron@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Ron',
      last_name: 'Weasley',
      location: Location.find_by(name: 'London') )

  User.create!(
      email: 'will@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'HR'),
      confirmed_at: Time.now,
      first_name: 'Will',
      last_name: 'Smith',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'denzel@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Data Scientist'),
      confirmed_at: Time.now,
      first_name: 'Denzel',
      last_name: 'Washington',
      location: Location.find_by(name: 'Seattle') )

  User.create!(
      email: 'banks@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Marketing'),
      confirmed_at: Time.now,
      first_name: 'Carlton',
      last_name: 'Banks',
      location: Location.find_by(name: 'Los Angeles') )

  User.create!(
      email: 'mick@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Project Manager'),
      confirmed_at: Time.now,
      first_name: 'Mick',
      last_name: 'Jagger',
      location: Location.find_by(name: 'London') )

  User.create!(
      email: 'mark@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Mark',
      last_name: 'Zuckerberg',
      location: Location.find_by(name: 'San Francisco') )

  User.create!(
      email: 'rab@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Robert',
      last_name: 'Burns',
      location: Location.find_by(name: 'Edinburgh') )

  User.create!(
      email: 'steve@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Steve',
      last_name: 'Jobs',
      location: Location.find_by(name: 'San Francisco') )


  User.create!(
      email: 'al@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Alfred',
      last_name: 'Pennyworth',
      location: Location.find_by(name: 'London') )

  User.create!(
      email: 'rob@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Project Manager'),
      confirmed_at: Time.now,
      first_name: 'Robert',
      last_name: 'Bruce',
      location: Location.find_by(name: 'Edinburgh') )

  User.create!(
      email: 'wal@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'William',
      last_name: 'Wallace',
      location: Location.find_by(name: 'Edinburgh') )

  User.create!(
      email: 'mel@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Mel',
      last_name: 'Gibson',
      location: Location.find_by(name: 'Krypton') )

  User.create!(
      email: 'hardy@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Tom',
      last_name: 'Hardy',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'liam@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Liam',
      last_name: 'Neeson',
      location: Location.find_by(name: 'Paris') )

  User.create!(
      email: 'orlando@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Orlando',
      last_name: 'Bloom',
      location: Location.find_by(name: 'Miami') )

  User.create!(
      email: 'harr@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'IT'),
      confirmed_at: Time.now,
      first_name: 'Harrison',
      last_name: 'Ford',
      location: Location.find_by(name: 'Los Angeles') )

  User.create!(
      email: 'han@jupiter.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Han',
      last_name: 'Solo',
      location: Location.find_by(name: 'Jupiter') )


  User.create!(
      email: 'jones@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Indiana',
      last_name: 'Jones',
      location: Location.find_by(name: 'New Orleans') )


  User.create!(
      email: 'deck@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Richard',
      last_name: 'Deckhard',
      location: Location.find_by(name: 'Los Angeles') )


  User.create!(
      email: 'dredd@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Judge',
      last_name: 'Dredd',
      location: Location.find_by(name: 'Dallas') )

  User.create!(
      email: 'rambo@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'John',
      last_name: 'Rambo',
      location: Location.find_by(name: 'Seattle') )

  User.create!(
      email: 'dennis@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Dennis',
      last_name: 'Reynolds',
      location: Location.find_by(name: 'Philadelphia') )


  User.create!(
      email: 'dee@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Dee',
      last_name: 'Reynolds',
      location: Location.find_by(name: 'Philadelphia') )


  User.create!(
      email: 'frank@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Project Manager'),
      confirmed_at: Time.now,
      first_name: 'Frank',
      last_name: 'Reynolds',
      location: Location.find_by(name: 'Philadelphia') )

  User.create!(
      email: 'cha@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'HR'),
      confirmed_at: Time.now,
      first_name: 'Charlie',
      last_name: 'Kelley',
      location: Location.find_by(name: 'Philadelphia') )

  User.create!(
      email: 'mac@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Ronald',
      last_name: 'MacDonald',
      location: Location.find_by(name: 'Philadelphia') )

  User.create!(
      email: 'cricket@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Rickety',
      last_name: 'Cricket',
      location: Location.find_by(name: 'Philadelphia') )


  User.create!(
      email: 'jack@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'IT'),
      confirmed_at: Time.now,
      first_name: 'Jack',
      last_name: 'Nicholson',
      location: Location.find_by(name: 'Dallas') )

  User.create!(
      email: 'obama@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Barack',
      last_name: 'Obama',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'step@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Stephen',
      last_name: 'King',
      location: Location.find_by(name: 'Vancouver') )

  User.create!(
      email: 'joe@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Joe',
      last_name: 'King',
      location: Location.find_by(name: 'Vancouver') )


  User.create!(
      email: 'tim@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Data Scientist'),
      confirmed_at: Time.now,
      first_name: 'Tim',
      last_name: 'Curry',
      location: Location.find_by(name: 'Seattle') )


  User.create!(
      email: 'rock@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Dwayne',
      last_name: 'Johnson',
      location: Location.find_by(name: 'Vancouver') )


  User.create!(
      email: 'beyonce@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'HR'),
      confirmed_at: Time.now,
      first_name: 'Beyonce',
      last_name: 'Knowles',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'joey@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Joey',
      last_name: 'Ramone',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'iggy@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Iggy',
      last_name: 'Pop',
      location: Location.find_by(name: 'Detroit') )


  User.create!(
      email: 'lou@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Lou',
      last_name: 'Reed',
      location: Location.find_by(name: 'New York') )


  User.create!(
      email: 'gaga@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Project Manager'),
      confirmed_at: Time.now,
      first_name: 'Lady',
      last_name: 'Gaga',
      location: Location.find_by(name: 'New York') )

  User.create!(
      email: 'garth@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Garth',
      last_name: 'Algar',
      location: Location.find_by(name: 'Detroit') )


  User.create!(
      email: 'js@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'IT'),
      confirmed_at: Time.now,
      first_name: 'John',
      last_name: 'Smith',
      location: Location.find_by(name: 'New Orleans') )

  User.create!(
      email: 'voldemort@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Tom',
      last_name: 'Riddle',
      location: Location.find_by(name: 'London') )

  User.create!(
      email: 'ney@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Neymar',
      last_name: 'Ofthat',
      location: Location.find_by(name: 'Barcelona') )

  User.create!(
      email: 'jose@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'human'),
      confirmed_at: Time.now,
      first_name: 'Jose',
      last_name: 'Mourinho',
      location: Location.find_by(name: 'Manchester') )

  User.create!(
      email: 'holden@earth.local',
      password: '12345678',
      password_confirmation: '12345678',
      groups: Group.where(name: 'Software Engineer'),
      confirmed_at: Time.now,
      first_name: 'Holden',
      last_name: 'Caulfield',
      location: Location.find_by(name: 'Manchester') )

User.create!(
    email: 'atreides@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Paul',
    last_name: 'Atreides',
    location: Location.find_by(name: 'Saturn') )


User.create!(
    email: 'vladimir@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Vladimir',
    last_name: 'Harkonnen',
    location: Location.find_by(name: 'Saturn') )

User.create!(
    email: 'einstein@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Albert',
    last_name: 'Einstein',
    location: Location.find_by(name: 'Berlin') )

User.create!(
    email: 'oppenheimer@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Robert',
    last_name: 'Oppenheimer',
    location: Location.find_by(name: 'New York') )

User.create!(
    email: 'feynman@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Richard',
    last_name: 'Feynman',
    location: Location.find_by(name: 'Chicago') )

User.create!(
    email: 'hawking@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Stephen',
    last_name: 'Hawking',
    location: Location.find_by(name: 'London') )

User.create!(
    email: 'turing@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Alan',
    last_name: 'Turing',
    location: Location.find_by(name: 'London') )

User.create!(
    email: 'bigbarry@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'Project Manager'),
    confirmed_at: Time.now,
    first_name: 'Barry',
    last_name: 'White',
    location: Location.find_by(name: 'London') )


User.create!(
    email: 'cartman@pluto.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'Data Scientist'),
    confirmed_at: Time.now,
    first_name: 'Eric',
    last_name: 'Cartman',
    location: Location.find_by(name: 'Dallas') )

User.create!(
    email: 'stan@earth.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'Project Manager'),
    confirmed_at: Time.now,
    first_name: 'Stan',
    last_name: 'Marsh',
    location: Location.find_by(name: 'Miami') )

User.create!(
    email: 'kenny@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'Software Engineer'),
    confirmed_at: Time.now,
    first_name: 'Kenny',
    last_name: 'McCormick',
    location: Location.find_by(name: 'Los Angeles') )

User.create!(
    email: 'madflavour@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Flavour',
    last_name: 'Flav',
    location: Location.find_by(name: 'Los Angeles') )

User.create!(
    email: 'foreman@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'George',
    last_name: 'Foreman',
    location: Location.find_by(name: 'Philadelphia') )

User.create!(
    email: 'chappelle@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'IT'),
    confirmed_at: Time.now,
    first_name: 'Dave',
    last_name: 'Chappelle',
    location: Location.find_by(name: 'Los Angeles') )

User.create!(
    email: 'kanye@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Kanye',
    last_name: 'West',
    location: Location.find_by(name: 'Chicago') )


User.create!(
    email: 'dogg@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'IT'),
    confirmed_at: Time.now,
    first_name: 'Snoop',
    last_name: 'Dogg',
    location: Location.find_by(name: 'Los Angeles') )

User.create!(
    email: 'dre@mars.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'human'),
    confirmed_at: Time.now,
    first_name: 'Dr',
    last_name: 'Dre',
    location: Location.find_by(name: 'Los Angeles') )

User.create!(
    email: 'action@saturn.local',
    password: '12345678',
    password_confirmation: '12345678',
    groups: Group.where(name: 'IT'),
    confirmed_at: Time.now,
    first_name: 'Action',
    last_name: 'Bronson',
    location: Location.find_by(name: 'New York') )

groups = Group.all - [Group.first]
group_count = groups.count
loc_count = Location.count
locations = Location.all
time = Time.now
2000.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: '12345678',
    password_confirmation: '12345678',
    groups: groups.sample(rand(1..(group_count))),
    confirmed_at: time,
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    location: locations.sample
  )
end

#Group.all.sample(rand(1..(Group.count)))
#(Group.all-Group.first).sample(rand(1..(Group.count - 1)))
