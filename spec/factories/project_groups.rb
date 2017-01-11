FactoryGirl.define do
  factory :project_group do
    sequence(:name) { |n| "Project Group #{n}" }
    sequence(:description) { |n| "This is test group number #{n}" }
    project
  end
end
