# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
  end
end
