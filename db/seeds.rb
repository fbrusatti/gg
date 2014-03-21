# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def create_user
  user = User.create(email: Faker::Name.email,
                     password: "12345678",
                     password_confirmation: "12345678")
end  

def create_customer
  name = Faker::Name.first_name
  Customer.create(name: name,
                  surname: Faker::Name.last_name,
                  phone:   Faker::PhoneNumber.phone_number,
                  email:   Faker::Internet.email(name))
end  

def create_supplier
  name = Faker::Name.first_name
  Supplier.create(name: name,
                  surname: Faker::Name.last_name,
                  phone:   Faker::PhoneNumber.phone_number,
                  email:   Faker::Internet.email(name))
end

def create_category
  3.times do
    Category.create(name: Faker::Name.category)
  end
end  

def create_money_and_vat
  Money.create(name:      Faker::Name.money,
               quotation: Faker::Number.digit,
               symbol:    Faker::Name.symbol)
  Vat.create(percentaje:  Faker::Name.vat)
end


def create_product
  min_stock = Faker::Number.digit
  Product.create(code:           Faker::Number.number(4),
                 minimun_stock:  Faker::Number.digit,
                 category_ids:   Category.last.id,
                 description:    Faker::Name.description,
                 money_id:       Money.last.id,
                 vat_id:         Vat.last.id,
                 cost_price:     Faker::Number.number(2).to_f,
                 minimun_stock:  min_stock,
                 stock:          min_stock.to_i + 2,
                 list_price_one: Faker::Number.number(2).to_f)

end  


2.times do |t|
  puts "iteration #{t+1} of 2 for the seed"
  create_customer
  puts "Customers created"
  create_supplier
  puts "Suppliers created"
  create_category
  puts "Categories created"
  create_money_and_vat
  puts "Money and Vat created"
  create_product
  puts "Products created"
end