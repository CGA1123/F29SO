FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:code) { |n| "P-#{n}" }
    sequence(:description) { |n| "-#{n}" }
    project_type
  end
end
