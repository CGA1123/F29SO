FactoryGirl.define do
  factory :notification do
    association :recipient, factory: :user
    association :actor, factory: :user
    association :notifiable, factory: :group
    action "added you to"
  end
end
