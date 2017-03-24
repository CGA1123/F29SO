FactoryGirl.define do
  factory :announcement do
    sequence(:title) { |n| "New #{n}" }
    sequence(:content) { |n| "Read this cool stuff #{n}" }
  end
end
