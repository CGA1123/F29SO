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

ProjectRoleUser.create!(user: User.find_by(email: 'rick@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'morty@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'batman@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'luke@saturn.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'ellen@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))

ProjectRoleUser.create!(user: User.find_by(email: 'mortyjr@earth-c137.local'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'bilbo@earth.local'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleUser.create!(user: User.find_by(email: 'frodo@earth.local'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))

ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Project_Manager', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Data_Analyst', project: Project.find_by(name: 'Air_Traffic_Automation')))
ProjectRoleLocation.create!(location: Location.find_by(name: 'Seattle'), project_role: ProjectRole.find_by(name: 'Software_Engineer', project: Project.find_by(name: 'Air_Traffic_Automation')))
