# system announcements
SystemAnnouncement.create!(user: User.first, title: 'System Launches', content: 'World celebrates as greatest management system ever is unleashed.')
SystemAnnouncement.create!(user: User.first, title: 'System Saves World', content: 'Global peace declared.')
SystemAnnouncement.create!(title: Faker::Company.buzzword, content: Faker::Company.catch_phrase)

# project announcements
Project.all.each do |project|
  users = project.users
  rand(1..10).times do
    ProjectAnnouncement.create!(title: Faker::Company.buzzword, content: Faker::Company.catch_phrase, project: project, user: users.sample)
  end
end
