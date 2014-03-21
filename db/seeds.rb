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
                  phone: Faker::PhoneNumber.phone_number,
                  email: Faker::Internet.email(name))
end  

def create_supplier
  name = Faker::Name.first_name
  Supplier.create(name: name,
                  surname: Faker::Name.last_name,
                  phone: Faker::PhoneNumber.phone_number,
                  email: Faker::Internet.email(name))
end

def create_category
  3.times do
    Category.create(name: Faker::Name.category)
  end
end  

def create_product
  Product.create(code: Faker::Number.number(4),
                 minimun_stock: Faker::Number.digit,
                 category_ids: Category.last.id,
                 description: Faker::Name.description)
end  

2.times do |t|
  puts "iteration #{t+1} of 2 for the seed"
  create_customer
  puts "Customers created"
  create_supplier
  puts "Suppliers created"
  create_category
  puts "Categories created"
  create_product
  puts "Products created"
end