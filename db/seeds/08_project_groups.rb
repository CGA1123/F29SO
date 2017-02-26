#project_001_groups
ProjectGroup.create!(name: 'smuggler', description: 'You have to get through customs somehow.', project: Project.find_by(name: 'seed_excursion'))
ProjectGroup.create!(name: 'Leader', description: 'Directs the operation.', project: Project.find_by(name: 'seed_excursion'))

#project_002_groups
ProjectGroup.create!(name: 'project_leader', description: 'Directs the operation.', project: Project.find_by(name: 'interdimensional_travel'))
