FactoryGirl.define do
  factory :permission do
    sequence(:name) { |n| "test.permission.#{n}" }
    sequence(:description) { |n| "This is test permission number #{n}" }
  end
end
