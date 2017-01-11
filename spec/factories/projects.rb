FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:code) { |n| n.to_s }
  end
end
