FactoryGirl.define do
  factory :project_role_permission do
    project_role
    permission
  end

  factory :project_role_location do
    project_role
    location
  end

  factory :project_role_user do
    project_role
    user
  end

  factory :project_location do
    project
    location
  end

  factory :group_permission do
    group
    permission
  end

  factory :group_user do
    group
    user
  end

  factory :invitation_group do
    invitation
    group
  end

  factory :user_skill do
    user
    skill
    rating :expert
  end

  factory :project_skill do
    project
    skill
    qualifier :required
  end
end
