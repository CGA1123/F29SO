#project 001 groups
ProjectRole.create!(name: 'Smuggler', description: 'You have to get through customs somehow.', project: Project. find_by(name: 'Seed Excursion'))
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project. find_by(name: 'Seed Excursion'))

#project 002 groups
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project. find_by(name: 'Interdimensional Travel'))

#001 users
ProjectRoleUser.create!(user: User. find_by(email: 'rick@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Smuggler', project: Project. find_by(name: 'Seed Excursion')))

#001 locations
ProjectRoleLocation.create!(location: Location. find_by(name: 'Earth'), project_role: ProjectRole. find_by(name: 'Smuggler', project: Project. find_by(name: 'Seed Excursion')))



# Project: Air Traffic Automation
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Air Traffic Automation'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Air Traffic Automation'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Air Traffic Automation'))
ProjectRoleUser.create!(user: User. find_by(email: 'mortyjr@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleUser.create!(user: User. find_by(email: 'bilbo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleUser.create!(user: User. find_by(email: 'frodo@earth.local'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Air Traffic Automation')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Seattle'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Air Traffic Automation')))

<<<<<<< HEAD
# Project: Drone Protection
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Drone Protection'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Drone Protection'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Drone Protection'))
ProjectRoleUser.create!(user: User. find_by(email: 'principal@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User. find_by(email: 'scary@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User. find_by(email: 'douglas@earth-c137.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User. find_by(email: 'vin@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleUser.create!(user: User. find_by(email: 'tom@pluto.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Dallas'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Dallas'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Drone Protection')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Dallas'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Drone Protection')))
=======
# Project: Drone_Protection
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Drone_Protection'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Drone_Protection'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Drone_Protection'))
ProjectRoleUser.create!(user: User.find_by(email: 'scary@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'douglas@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'vin@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'tom@pluto.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
>>>>>>> More seeds

# Project: Fuels Management
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Fuels Management'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Fuels Management'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Fuels Management'))
ProjectRoleUser.create!(user: User. find_by(email: 'harry@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'batman@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'superman@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'luke@saturn.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleUser.create!(user: User. find_by(email: 'ellen@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Fuels Management')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Rome'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Fuels Management')))

# Project: Baggage and Cargo Scanning
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Baggage and Cargo Scanning'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Baggage and Cargo Scanning'))
ProjectRoleUser.create!(user: User. find_by(email: 'tom@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'tony@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'ba@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'trump@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleUser.create!(user: User. find_by(email: 'elvis@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Baggage and Cargo Scanning')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Madrid'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Baggage and Cargo Scanning')))

# Project: Electronic Warfare
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Electronic Warfare'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Electronic Warfare'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Electronic Warfare'))
ProjectRoleUser.create!(user: User. find_by(email: 'hammond@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'frodo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'bilbo@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'chief@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleUser.create!(user: User. find_by(email: 'lime@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Electronic Warfare')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Berlin'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Electronic Warfare')))

# Project: Electronic Warfare
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Application Development'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Application Development'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Application Development'))
ProjectRoleUser.create!(user: User. find_by(email: 'spiderman@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'clooney@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'hannibal@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'walter@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'diehard@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Application Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Application Development')))

# Project: Agile Software Development
ProjectRole.create!(name: 'Project Manager', description: 'Manager', project: Project. find_by(name: 'Agile Software Development'))
ProjectRole.create!(name: 'Software Engineer', description: 'Coder', project: Project. find_by(name: 'Agile Software Development'))
ProjectRole.create!(name: 'Data Analyst', description: 'An analyser of data', project: Project. find_by(name: 'Agile Software Development'))
ProjectRoleUser.create!(user: User. find_by(email: 'snake@earth.local'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'wayne@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'crane@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'brendan@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleUser.create!(user: User. find_by(email: 'murphy@earth.local'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Project Manager', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Data Analyst', project: Project. find_by(name: 'Agile Software Development')))
ProjectRoleLocation.create!(location: Location. find_by(name: 'Istanbul'), project_role: ProjectRole. find_by(name: 'Software Engineer', project: Project. find_by(name: 'Agile Software Development')))
