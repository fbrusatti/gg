# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    type ""
    amount "9.99"
    number "MyString"
    name "MyString"
    code "MyString"
    expirate_at "2014-04-14"
  end
end
