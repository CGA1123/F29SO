FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:code) { |n| "P-#{n}" }
    project_type
  end
end
