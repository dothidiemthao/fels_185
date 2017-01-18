15.times do |n|
  title = "Category_#{n+1}"
  Category.create!(title: title, quantity_question: Settings.quanlity_question)
end

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Lesson.create!(user_id: 1, category_id: 15)

Result.create!(lesson_id: 1, word_id: 1, answer_id: 2)
Result.create!(lesson_id: 1, word_id: 2, answer_id: 5)
Result.create!(lesson_id: 1, word_id: 3, answer_id: 7)
Result.create!(lesson_id: 1, word_id: 4, answer_id: 12)
Result.create!(lesson_id: 1, word_id: 5, answer_id: 16)
