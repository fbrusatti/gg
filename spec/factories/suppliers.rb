# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supplier do
    address "roma 1228"
    cuit_cuil "23-23456789-0"
    dni "12345678"
    email "hola_vengo_a@flotar.com"
    gross_income "1000"
    mobile_phone "123654987"
    name "Peter"
    phone "1234567"
    registered_name "ni idea"
    surname "Languila"
    type_iva "evade iva"
  end
end
