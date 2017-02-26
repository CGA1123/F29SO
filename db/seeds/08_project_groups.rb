ProjectGroup.create!(name: 'smuggler', description: 'You have to get through customs somehow.', project: Project.find_by(name: 'seed_excursion'))

ProjectGroup.create!(name: 'Leader', description: 'Directs the operation.', project: Project.find_by(name: 'seed_excursion'))
