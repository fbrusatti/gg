# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    description "Soy un producto"
    stock 5
    minimun_stock 1
    cost_price 100.5
    code "002589"
    active ""
    gondola "A1"
    shelf "2"
    list_price_one 10.5
    list_price_two 20.5
    list_price_three 30.5
  end
end
