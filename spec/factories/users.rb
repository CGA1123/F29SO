FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'Icle'
    location 'Edinburgh'
    sequence(:email) { |n| "user-#{n}@test.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now.getlocal
    groups { [FactoryGirl.create(:group)] }

    factory :root_user do
      groups { [FactoryGirl.create(:group, name: 'root')] }
    end
  end
end
