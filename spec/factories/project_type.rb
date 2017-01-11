FactoryGirl.define do
  factory :project_type do
    sequence(:name) { |n| "Project Type #{n}" }
    sequence(:description) { |n| "This is test project type #{n}" }
  end
end
