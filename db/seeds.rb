require 'ffaker'

# Admin user
User.create!(firstname: 'Netguru',
             lastname: 'Workshops',
             email: 'netguru@workshops.com',
             password: 'adminadmin',
             password_confirmation: 'adminadmin',
             admin: true)

# Regular users
5.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.free_email(firstname)
  password = 'password'
  User.create!(firstname: firstname,
               lastname: lastname,
               email: email,
               password: password,
               created_at: rand(0..10).days.ago)
end

# Categories
Category.create!(name: 'Herb and Spice')

# Products
6.times do 
  title = Faker::Food.herb_or_spice
  description = Faker::Lorem.sentence
  price = "#{rand(1..200)}.#{rand(1..99)}"
  user_id = rand(2..6)
  category_id = 1
  Product.create!(title: title,
                  description: description,
                  price: price,
                  user_id: user_id,
                  category_id: category_id)
end

# Reviews
(1..6).each do |product_id|
  (2..rand(3..6)).each do |user_id|
    content = Faker::Lorem.paragraph(rand(1..3))
    rating = rand(1..5)
    Review.create!(content: content,
                   rating: rating,
                   product_id: product_id,
                   user_id: user_id)
  end
end
