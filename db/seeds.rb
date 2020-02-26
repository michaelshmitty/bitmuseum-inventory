require 'faker'

Item.delete_all
User.delete_all
Category.delete_all
Brand.delete_all
Owner.delete_all

computer_category = Category.create!(name: "Computers")
console_category = Category.create!(name: "Consoles")
software_category = Category.create!(name: "Software")

user = User.create!(
  email: "user@example.com",
  first_name: "John",
  last_name: "Doe",
  password: "secret"
)

owner = Owner.create! name: "Unknown"
brand = Brand.create! name: "A"
brand = Brand.create! name: "B"
brand = Brand.create! name: "C"

item1 = Item.create!(
  category: computer_category,
  brand: brand,
  owner: owner,
  user: user,
  name: Faker::Commerce.product_name,
  year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
  description: Faker::Movies::Ghostbusters.quote
)

item2 = Item.create!(
  category: console_category,
  brand: brand,
  owner: owner,
  user: user,
  name: Faker::Commerce.product_name,
  year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
  description: Faker::Movies::Ghostbusters.quote
)

item3 = Item.create!(
  category: software_category,
  brand: brand,
  owner: owner,
  user: user,
  name: Faker::Commerce.product_name,
  year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
  description: Faker::Movies::Ghostbusters.quote
)

item4 = Item.create!(
  category: software_category,
  brand: brand,
  owner: owner,
  user: user,
  name: Faker::Commerce.product_name,
  year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
  description: Faker::Movies::Ghostbusters.quote
)

item1.linked_items << [item2, item3, item4]

random_users = []
3.times do
  random_users << User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password,
  )
end

233.times do
  Item.create!(
    category: computer_category,
    brand: brand,
    owner: owner,
    user: random_users.sample,
    name: Faker::Commerce.product_name,
    year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
    description: Faker::Movies::Ghostbusters.quote
  )
end
