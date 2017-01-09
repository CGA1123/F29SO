FactoryGirl.define do
  factory :project_group do |f|
    sequence(:name) { |n| "Project Group #{n}" }
    f.association :project
    sequence(:description) { |n| "This is test group number #{n}" }
  end
end
