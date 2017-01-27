FactoryGirl.define do
  factory :skill_type do
    sequence(:name) { |n| "Skill Type #{n}" }
    sequence(:description) { |n| "This is Skill project type #{n}" }
  end
end
