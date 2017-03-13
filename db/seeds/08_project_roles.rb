#project_001_groups
ProjectRole.create!(name: 'smuggler', description: 'You have to get through customs somehow.', project: Project.find_by(name: 'seed_excursion'))
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project.find_by(name: 'seed_excursion'))

#project_002_groups
ProjectRole.create!(name: 'project_leader', description: 'Directs the operation.', project: Project.find_by(name: 'interdimensional_travel'))

#001_users
ProjectRoleUser.create!(user: User.find_by(email: 'rick@earth-c137.local'), project_role: ProjectRole.find_by(name: 'smuggler', project: Project.find_by(name: 'seed_excursion')))

#001_locations
ProjectRoleLocation.create!(location: Location.find_by(name: 'Earth'), project_role: ProjectRole.find_by(name: 'smuggler', project: Project.find_by(name: 'seed_excursion')))



# Project: Air_Traffic_Automation
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Air_Traffic_Automation'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Air_Traffic_Automation'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Air_Traffic_Automation'))
ProjectRoleUser.create!(user: User.find_by(email: 'mortyjr@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'bilbo@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'frodo@earth.local'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))

# Project: Drone_Protection
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Drone_Protection'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Drone_Protection'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Drone_Protection'))
ProjectRoleUser.create!(user: User.find_by(email: 'principal@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'scary@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'douglas@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'vin@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleUser.create!(user: User.find_by(email: 'tom@pluto.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Drone_Protection')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Dallas'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Drone_Protection')))

# Project: Fuels_Management
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Fuels_Management'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Fuels_Management'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Fuels_Management'))
ProjectRoleUser.create!(user: User.find_by(email: 'harry@earth.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleUser.create!(user: User.find_by(email: 'batman@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleUser.create!(user: User.find_by(email: 'superman@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleUser.create!(user: User.find_by(email: 'luke@saturn.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleUser.create!(user: User.find_by(email: 'ellen@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Rome'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Rome'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Fuels_Management')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Rome'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Fuels_Management')))

# Project: Baggage_and_Cargo_Scanning
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning'))
ProjectRoleUser.create!(user: User.find_by(email: 'tom@earth.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleUser.create!(user: User.find_by(email: 'tony@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleUser.create!(user: User.find_by(email: 'ba@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleUser.create!(user: User.find_by(email: 'trump@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleUser.create!(user: User.find_by(email: 'elvis@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Madrid'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Madrid'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Madrid'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Baggage_and_Cargo_Scanning')))

# Project: Electronic_Warfare
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Electronic_Warfare'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Electronic_Warfare'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Electronic_Warfare'))
ProjectRoleUser.create!(user: User.find_by(email: 'hammond@earth.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleUser.create!(user: User.find_by(email: 'frodo@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleUser.create!(user: User.find_by(email: 'bilbo@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleUser.create!(user: User.find_by(email: 'chief@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleUser.create!(user: User.find_by(email: 'lime@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Berlin'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Berlin'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Electronic_Warfare')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Berlin'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Electronic_Warfare')))

# Project: Electronic_Warfare
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Application_Development'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Application_Development'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Application_Development'))
ProjectRoleUser.create!(user: User.find_by(email: 'spiderman@earth.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Application_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'clooney@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Application_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'hannibal@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Application_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'walter@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Application_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'diehard@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Application_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Application_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Application_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Application_Development')))

# Project: Agile_Software_Development
ProjectRole.create!(name: 'Project_Manager', description: 'Manager', project: Project.find_by(name: 'Agile_Software_Development'))
ProjectRole.create!(name: 'Software_Engineer', description: 'Coder', project: Project.find_by(name: 'Agile_Software_Development'))
ProjectRole.create!(name: 'Data_Analyst', description: 'An analyser of data', project: Project.find_by(name: 'Agile_Software_Development'))
ProjectRoleUser.create!(user: User.find_by(email: 'snake@earth.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'wayne@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'crane@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'brendan@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleUser.create!(user: User.find_by(email: 'murphy@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Agile_Software_Development')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Istanbul'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Agile_Software_Development')))
