
500.times do
  project = ProjectRole.find(rand(1..(ProjectRole.count)))
  skill = Skill.find(rand(1..(Skill.count)))
  ProjectRoleSkill.create!(project_role: project, skill: skill, rating:rand(0..4)) unless project.project(skill)
end
