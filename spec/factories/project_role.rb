FactoryGirl.define do
  factory :project_role do
    sequence(:name) { |n| "Project Role #{n}" }
    sequence(:description) { |n| "This is test group number #{n}" }
    project
  end
end
