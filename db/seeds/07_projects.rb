#seeds
project1 = Project.create!(name: 'seed_excursion', code: '001', project_type: ProjectType.find_by(name: 'scientific'))
