require 'faker'

User.destroy_all
Category.destroy_all

computer_category = Category.create!(name: "Computers")

user = User.where(email: "user@example.com").first_or_create!(
  first_name: "John",
  last_name: "doe",
  password: "secret"
)

random_users = []
3.times do
  random_users << User.where(email: Faker::Internet.email).first_or_create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password,
  )
end

10.times do
  Item.create!(
    category: computer_category,
    user: random_users.sample,
    name: Faker::Commerce.product_name,
    year: Faker::Date.between(from: 40.years.ago, to: 10.years.ago).year,
    description: Faker::Movies::Ghostbusters.quote
  )
end
