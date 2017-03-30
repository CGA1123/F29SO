FactoryGirl.define do
  factory :project_role do
    sequence(:name) { |n| "Project Role #{n}" }
    sequence(:description) { |n| "This is test group number #{n}" }
    start_date Time.current
    end_date Time.current.next_week
    project
  end
end
