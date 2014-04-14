# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def create_users
  User.create(email:                 "user@user.com",
              password:              "123123123",
              password_confirmation: "123123123")
  AdminUser.create(email:                 "user@user.com",
                   password:              "123123123",
                   password_confirmation: "123123123")
end  

def create_customer
  50.times do 
    name = Faker::Name.first_name
    Customer.create(name: name,
                    surname:   Faker::Name.last_name,
                    phone:     Faker::PhoneNumber.phone_number,
                    email:     Faker::Internet.email(name),
                    cuit_cuil: Faker::Name.cuit_cuil,
                    type_iva:  Faker::Name.type_iva)
  end  
end  

def create_supplier
  50.times do
    name = Faker::Name.first_name
    Supplier.create(name: name,
                    surname:   Faker::Name.last_name,
                    phone:     Faker::PhoneNumber.phone_number,
                    email:     Faker::Internet.email(name),
                    cuit_cuil: Faker::Name.cuit_cuil,
                    type_iva:  Faker::Name.type_iva)
  end  
end

def create_category
  20.times do
    Category.create(name: Faker::Name.category)
  end
  5.times do |c|
    category = Category.find(c + 1)
    category.referrer_id = c + 2
    category.save 
  end  
end  

def create_money_and_vat
  Money.create(name:      Faker::Name.money,
               quotation: Faker::Number.digit,
               symbol:    Faker::Name.symbol)
  Vat.create(percentaje:  Faker::Name.vat)
end


def create_product
  50.times do
    min_stock = Faker::Number.digit
    Product.create(code:           Faker::Number.number(4),
                   category_ids:   Faker::Number.digit.to_i + 1,
                   description:    Faker::Name.description,
                   money_id:       Money.last.id,
                   vat_id:         Vat.last.id,
                   cost_price:     Faker::Number.number(2).to_f,
                   minimun_stock:  min_stock,
                   stock:          min_stock.to_i + 2,
                   list_price_one: Faker::Number.number(2).to_f)
  end
end  

def create_bank
  10.times do |l|
    location = (l*3)+5
    Bank.create(name:                 Faker::Name.bank,
                branch_office_number: Faker::Number.digit,
                address:              Faker::Address.street_address,
                location_id:          location)
  end  
end


create_users
puts "User and AdminUser created"
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
create_bank
puts "Banks created"

