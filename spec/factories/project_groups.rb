FactoryGirl.define do
  factory :project_group do
    sequence(:name) { |n| "Project Group #{n}" }
    sequence(:project) { |n| n }
    sequence(:description) { |n| "This is test group number #{n}" }
  end
end
