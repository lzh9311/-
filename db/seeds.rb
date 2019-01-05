# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "sqing",
    email: "763693955@qq.com",
    password: "1234567",
    password_confirmation: "1234567",
    admin: true)
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
    d_author = "sqing"
    d_durl = "www.baidu.com"
    d_name = "MNIST"
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content,d_durl: d_durl,
                                            d_name: d_name,d_author: d_author)}
end