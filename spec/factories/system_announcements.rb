FactoryGirl.define do
  factory :system_announcement do
    user
    sequence(:title) { |n| "New #{n}" }
    sequence(:content) { |n| "Read this cool stuff #{n}" }
  end
end
