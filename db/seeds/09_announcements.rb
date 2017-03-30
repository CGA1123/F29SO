# system announcements
SystemAnnouncement.create!(user: User.first, title: 'System Launches', content: 'World celebrates as greatest management system ever is unleashed.')
SystemAnnouncement.create!(user: User.first, title: 'System Saves World', content: 'Global peace declared.')

# project announcements
ProjectAnnouncement.create!(user: User.first, title: 'Project begins', content: 'Time to begin this stuff', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(user: User.first, title: 'Perfection', content: 'Tactical turtleneck production is greenlit', project: Project.find_by(id: 2))
ProjectAnnouncement.create!(user: User.first, title: 'Project finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(user: User.first, title: 'Project finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(user: User.first, title: 'Project finishedProject finishedProject finishedProject finishedProject finishedProject finishedProject finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(user: User.first, title: 'Project finished', content: 'Project completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff released', project: Project.find_by(id: 1))
