FactoryGirl.define do
  factory :project_announcement do
    sequence(:title) { |n| "New #{n}" }
    sequence(:content) { |n| "Read this cool stuff #{n}" }
    project
  end
end
