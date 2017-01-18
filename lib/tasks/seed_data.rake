namespace :seed_data do
  desc "TODO"
  task create_admin: :environment do
    User.create!(name: "Admin", email: "admin@gmail.com", password: "123123",
      is_admin: true)
  end

  desc "TODO"
  task create_user: :environment do
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password)
    end
  end

  desc "TODO"
  task create_follow: :environment do
    users = User.all
    user  = users.first
    following = users[2..50]
    followers = users[3..40]
    following.each { |followed| user.follow(followed) }
    followers.each { |follower| follower.follow(user) }
  end

  desc "TODO"
  task create_category: :environment do
    10.times do |n|
      title  = Faker::Name.name
      Category.create! title: title,
        quantity_question: Settings.quanlity_question
    end
  end
end
