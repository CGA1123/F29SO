
500.times do
  user = User.find(rand(1..(User.count)))
  skill = Skill.find(rand(1..(Skill.count)))
  UserSkill.create!(user: user, skill: skill, rating: rand(0..4)) unless user.skills.include?(skill)
end
