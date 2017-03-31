FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:code) { |n| "P-#{n}" }
    sequence(:description) { |n| "-#{n}" }
    start_date Time.current
    end_date Time.current.next_week
    project_type
  end
end
