FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Group #{n}" }
    sequence(:description) { |n| "This is test group number #{n}" }
  end
end
