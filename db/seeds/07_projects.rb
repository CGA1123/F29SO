#seeds
Project.create!(name: 'seed_excursion', code: '001', project_type: ProjectType.find_by(name: 'scientific'))

Project.create!(name: 'interdimensional_travel', code: '002', project_type: ProjectType.find_by(name: 'scientific'))
