FactoryGirl.define do
  factory :invitation do
    sequence(:email) { |n| "user-#{n}@test.com" }
    token Time.now.getlocal.to_s
    groups { [FactoryGirl.create(:group)] }
    sent_at Time.now.getlocal
    inviter { FactoryGirl.create(:user) }
  end
end
