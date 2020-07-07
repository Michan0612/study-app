User.create!(
    email: 'emily@gmail.com',
    password: 'foobar',
    password_confirmation: 'foobar',
)

5.times do |n|
  email = "emily_#{n+1}@gmail.com"
  password = 'password'

  User.create!(
  email: email,
  password: password,
  password_confirmation: password,
  )
end

users = User.order(:created_at).take(3)
50.times do
  memo = Faker::Lorem.sentence(6)
  users.each { |user| user.microposts.create!(memo: memo) }
end
