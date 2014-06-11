namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #User.create!(name: "Example User",
    #             email: "foobar@foobar.org",
    #             password: "foobar",
    #             password_confirmation: "foobar",
    #             admin: true)               

    admin = User.create!(name: "admin",
                         email: "admin@admin.org",
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
end