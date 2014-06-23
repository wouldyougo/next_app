## bundle exec rake db:reset
## bundle exec rake db:populate
## bundle exec rake db:postulate
## bundle exec rake db:relations
## bundle exec rake test:prepare

namespace :db do
  desc "Fill database with sample data"
  # заполняем users фейковыми данными
  task populate: :environment do
    make_users
  end
  
  # заполняем microposts фейковыми данными
  task postulate: :environment do
    make_microposts
  end

  # образцы взаимоотношений
  task relations: :environment do
    make_relationships
  end
end

def make_users
  #User.create!(name: "Example User",
  #             email: "foobar@foobar.com",
  #             password: "foobar",
  #             password_confirmation: "foobar",
  #             admin: true)

  admin = User.create!(name: "admin",
                       email: "admin@admin.com",
                       password: "admin",
                       password_confirmation: "admin",
                       admin: true)

  100.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  #limit: 6 не заработало
  #users = User.all(limit: 6)
  users = User.all
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  # организовали слежение первого пользователя за сообщениями пользователей с 3 по 51,
  # а затем принудили пользователей с 4 по 41 читать сообщения первого пользователя
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
