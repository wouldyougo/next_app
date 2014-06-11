namespace :db do
  desc "Fill database with sample data"
  #заполняем users фейковыми данными
  task populate: :environment do
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
  
  #заполняем microposts фейковыми данными
  task postulate: :environment do    
    #limit: 6 не заработало
    #users = User.all(limit: 6)
    users = User.all
    5.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end  
end