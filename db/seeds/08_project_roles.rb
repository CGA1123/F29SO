#project_001_groups
ProjectRole.create!(name: 'smuggler', description: 'You have to get through customs somehow.', project: Project.find_by(name: 'seed_excursion'))
ProjectRole.create!(name: 'Leader', description: 'Directs the operation.', project: Project.find_by(name: 'seed_excursion'))

#project_002_groups
ProjectRole.create!(name: 'project_leader', description: 'Directs the operation.', project: Project.find_by(name: 'interdimensional_travel'))

#001_users
ProjectRoleUser.create!(user: User.find_by(email: 'rick@earth-c137.local'), project_role: ProjectRole.find_by(name: 'smuggler', project: Project.find_by(name: 'seed_excursion')))
