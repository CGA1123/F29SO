FactoryGirl.define do
  factory :skill do
    sequence(:name) { |n| "Skill #{n}" }
    description 'Test skill'
    skill_type
  end
end
