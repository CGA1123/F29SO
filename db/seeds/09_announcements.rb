# system announcements
SystemAnnouncement.create!(title: 'System Launches', content: 'World celebrates as greatest management system ever is unleashed.')
SystemAnnouncement.create!(title: 'System Saves World', content: 'Global peace declared.')

# project announcements
ProjectAnnouncement.create!(title: 'Project begins', content: 'Time to begin this stuff', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(title: 'Perfection', content: 'Tactical turtleneck production is greenlit', project: Project.find_by(id: 2))
ProjectAnnouncement.create!(title: 'Project finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(title: 'Project finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(title: 'Project finishedProject finishedProject finishedProject finishedProject finishedProject finishedProject finished', content: 'Project completed and staff released', project: Project.find_by(id: 1))
ProjectAnnouncement.create!(title: 'Project finished', content: 'Project completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff releasedProject completed and staff released', project: Project.find_by(id: 1))
