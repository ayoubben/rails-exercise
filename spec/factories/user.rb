FactoryGirl.define do
  factory :user do
    full_name "ayoub test"
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
  end
end
