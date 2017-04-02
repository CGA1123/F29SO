
#project 001 groups
ProjectRole.create!(name: 'Smuggler', description: 'You have to get through customs somehow.', project: Project. find_by(name: 'Seed Excursion'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project. find_by(name: 'Seed Excursion'), start_date: "2017/3/18", end_date: "2017/6/09")

#project 002 groups
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project. find_by(name: 'Interdimensional Travel'), start_date: "2017/1/04", end_date: "2018/02/15")

#001 users
ProjectRoleUser.create!(user: User. find_by(email: 'rick@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Smuggler', project: Project. find_by(name: 'Seed Excursion')))

#001 locations
ProjectRoleLocation.create!(location: Location. find_by(name: 'Earth'), project_role: ProjectRole. find_by(name: 'Smuggler', project: Project. find_by(name: 'Seed Excursion')))



# Project: Air Traffic Automation
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Air Traffic Automation'), start_date: "2017/3/18", end_date: "2018/03/18")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Air Traffic Automation'), start_date: "2017/3/18", end_date: "2018/03/18")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Air Traffic Automation'), start_date: "2017/3/18", end_date: "2017/9/21")
ProjectRoleUser.create!(user: User. find_by(email: 'mortyjr@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleUser.create!(user: User. find_by(email: 'bilbo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleUser.create!(user: User. find_by(email: 'frodo@earth.local'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Air Traffic Automation')))


# Project: Drone Protection
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project.find_by(name: 'Drone Protection'), start_date: "2017/3/18", end_date: "2018/3/18")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project.find_by(name: 'Drone Protection'), start_date: "2017/3/18", end_date: "2018/3/18")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Drone Protection'), start_date: "2017/3/20", end_date: "2018/01/10")
ProjectRoleUser.create!(user: User.find_by(email: 'scary@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software Engineer', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'douglas@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software Engineer', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'vin@earth.local'), project_role: ProjectRole.find_by(name: 'Software Engineer', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'tom@pluto.local'), project_role: ProjectRole.find_by(name: 'Software Engineer', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Project Manager', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Data Analyst', project: Project.find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Software Engineer', project: Project.find_by(name: 'Drone Protection')))


# Project: Fuels Management
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Fuels Management'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Fuels Management'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Fuels Management'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRoleUser.create!(user: User. find_by(email: 'harry@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'batman@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'superman@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'luke@saturn.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'ellen@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))

# Project: Baggage and Cargo Scanning
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Baggage and Cargo Scanning'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Baggage and Cargo Scanning'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRoleUser.create!(user: User. find_by(email: 'tom@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'tony@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'ba@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'trump@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'elvis@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))

# Project: Electronic Warfare
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Electronic Warfare'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Electronic Warfare'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Electronic Warfare'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRoleUser.create!(user: User. find_by(email: 'hammond@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'frodo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'bilbo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'chief@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'lime@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))

# Project: Electronic Warfare
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Application Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Application Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Application Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRoleUser.create!(user: User. find_by(email: 'spiderman@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'clooney@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'hannibal@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'walter@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'diehard@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))

# Project: Agile Software Development
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Agile Software Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Agile Software Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Agile Software Development'), start_date: "2017/3/18", end_date: "2017/6/09")
ProjectRoleUser.create!(user: User. find_by(email: 'snake@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'wayne@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'crane@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'brendan@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'murphy@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))

ProjectRoleUser.create!(user: User.first, project_role: Project.first.project_roles.first)
ProjectRoleUser.create!(user: User.first, project_role: Project.second.project_roles.first)

projects = Project.all
100.times { ProjectRole.create(project: projects.sample, name: Faker::Name.title) }

users = User.all
project_roles = ProjectRole.all
300.times { ProjectRoleUser.create(user: users.sample, project_role: project_roles.sample) }

locations = Location.all
200.times { ProjectRoleLocation.create(location: locations.sample, project_role: project_roles.sample) }
