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

  # образцы взаимоотношений
  task user_orders: :environment do
    make_user_orders
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
                       active: true,
                       admin: true)

  reader = User.create!(name: "reader",
                       email: "reader@reader.com",
                       password: "reader",
                       password_confirmation: "reader",
                       active: true,
                       admin: false,
                       reader: true)

  reader = User.create!(name: "user",
                        email: "user@user.com",
                        password: "user",
                        password_confirmation: "user",
                        active: true,
                        admin: false,
                        reader: false)
  20.times do |n|
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
  3.times do
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

def make_user_orders
  #users = User.all
  users_all = User.all
  users = users_all[0..10]

  11.times do
    reader_id = nil
    #reader_id = 1
    #abonent = "Example User"
    #address = "Example address"
    abonent  = Faker::Name.name
    address = Faker::Lorem.sentence(5)
    phone = "4742381381"
    phone_mobile  = "9059059050"
    # Новая / Принята / Отклонена
    order_status = "Новая"
    #order_status = "Принята"
    #order_status = nil
    #contract_date = Time.now
    contract_date = nil

    #connection_date = Date.today
    connection_date = Time.now
    #inet_tariff_plan  = "Example inet_tariff_plan"
    inet_tariff_plan  = nil
    #Аренда Продажа Рассрочка
    #inet_device_contract = "Рассрочка"
    inet_device_contract = "Продажа"
    #inet_installment_plan = 10
    inet_installment_plan = nil

    iptv_tariff_plan  = "Example iptv_tariff_plan"
    #iptv_tariff_plan  = " "
    #iptv_tariff_plan  = nil
    iptv_device_contract = "Рассрочка"
    #iptv_device_contract = "Продажа"
    #iptv_device_contract = nil
    iptv_installment_plan = "10"
    #iptv_installment_plan = nil

    passport_series = "4742"
    passport_number = "474245"
    date_of_birth = Date.today
    place_of_birth = "place_of_birth"
    passport_registration_date = Date.today
    passport_issued_by = Faker::Lorem.sentence(5)

    users.each { |user| user.orders.create!(reader_id: reader_id,
                                            abonent: abonent,
                                            address: address,
                                            phone: phone,
                                            phone_mobile: phone_mobile,
    order_status: order_status,
    contract_date: contract_date,
    connection_date: connection_date,

    inet_tariff_plan: inet_tariff_plan,
    inet_device_contract: inet_device_contract,
    inet_installment_plan: inet_installment_plan,
    iptv_tariff_plan: iptv_tariff_plan,
    iptv_device_contract: iptv_device_contract,
    iptv_installment_plan: iptv_installment_plan,

    passport_series: passport_series,
    passport_number: passport_number,
    date_of_birth: date_of_birth,
    place_of_birth: place_of_birth,
    passport_registration_date: passport_registration_date,
    passport_issued_by: passport_issued_by
    ) }
  end
end