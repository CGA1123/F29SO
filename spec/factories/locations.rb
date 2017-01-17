FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Nuclear Test Location X4#{n}78" }
  end
end
