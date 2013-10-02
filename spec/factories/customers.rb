# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    dni "33.123.456"
    name "Marcelo"
    surname "Tinelli"
    mobile_phone "154123456"
    phone "4521345"
    email "mtinelli@gmail.com"
    registered_name "millonario"
    cuit_cuil "20-12345678-9"
    gross_income "1.000.000.000.000"
    address "buenos aires mansion 3"
  end
end
