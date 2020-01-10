require 'faker'

User.destroy_all
Category.destroy_all
Brand.destroy_all
Item.destroy_all
Owner.destroy_all

computer_category = Category.create!(name: "Computers")

user = User.create!(
  email: "user@example.com",
  first_name: "John",
  last_name: "doe",
  password: "secret"
)

owner = Owner.create! name: "Unknown"
brand = Brand.create! name: "Unknown"

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
