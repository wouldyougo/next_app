#HOWTO

## Ruby on Rails

### ruby on rails install
    sudo apt-get install curl
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    \curl -sSL https://get.rvm.io | bash -s stable --rails

    rvm install 2.1.2
    gem install rails

    rvm reinstall ruby
    rvm reinstall rails

    sudo apt-get install nodejs

Запускает консоль Bash и перечитывает файлы персональной инициализации (типа ~/.profile)
    bash --login

    rails -v
    ruby -v
    rvm use 2.1.2

### rails new
    rails new next_app
    cd '/home/user/Projects/next_app'


### bundle install
    bundle install --without production
    bundle install --without production staging
    bundle update
    bundle install

    bundle show [gemname]
    bundle show rails

### rails server
    rails server
    http://localhost:3000/
    rails s

### gemfile
    gem 'uglifier', '>= 1.3.0'
устанавливает последнюю версию гема uglifier
даже если его последняя версия значительно отличается от 1.3.0
даже если это, скажем, версия 7.2.

    gem 'coffee-rails', '~> 4.0.0'
устанавливает гем coffee-rails с версией не старее чем 4.0.0, но не новее чем 4.1

### Документация:
* Please feel free to use a different markup language if you do not plan to run
  <tt>rake doc:app</tt>.
* Для создания документации в HTML-формате можно воспользоваться следующей командой rake:
  <tt>rake doc:app</tt>.
* Объем созданного программного кода:
    rake stats

### Комментарий
#однострочный комментарий
=begin
многострочный комментарий
=end

### Локализация
В файлах application.rb по умолчанию есть инструкция,
как добавлять локали из другой директории,
и как настраивать другую локаль по умолчанию.

#### Локализация  activerecord
  activerecord:
    models:
      user:
    attributes:
      user:
        name: "Имя"
        phone: "Телефон"
        comment:  "Комментарий"

#### Добавить перевод Заявки
  activerecord:
    models:
      order:
    attributes:
      order:
        abonent:                    "ФИО абонента"

        passport_series:            "Серия паспорта"
        passport_number:            "Номер паспорта"
        date_of_birth:              "Дата рождения"
        place_of_birth:             "Место рождения"
        passport_registration_date: "Когда выдан паспорт"
        passport_issued_by:         "Кем выдан"

        address:                    "Адрес подключения"
        phone:                      "Телефон домашний"
        phone_mobile:               "Телефон сотовый"

        inet_tariff_plan:           "Тарифный план ШПД"
        inet_device_contract:       "Оборудование: продажа/рассрочка/аренда"
        inet_installment_plan:      "Рассрочка на сколько месяцев"

        iptv_tariff_plan:           "Тарифный план IPTV"
        iptv_device_contract:       "Оборудование: продажа/рассрочка/аренда"
        iptv_installment_plan:      "Рассрочка на сколько месяцев"

        connection_date:            "Предполагаемая дата подключения"
        contract_date:              "Дата продажи"
        order_status:               "Статус заявки: Новая / Принята / Отклонена"

        order_writer:               "ФИО агента, подключившего услугу"
        order_reader:               "ФИО супервайзера агента"

#### Локализация actionview::helpers
    <%= f.label :phone, "Телефон" %>
если есть локализация  activerecord, тогда просто:
    <%= f.label :phone %>

###Перечень всех маршрутов
по этому адресу будет виден перечень всех ваших маршрутов:
    http://localhost:3000/rails/info/routes/

### Ajax
Rails делает реализацию Ajax легкой, заменим:
    form_for
    form_for ..., remote: true

### javascripts
    app/assets/javascripts/application.js
    //= require jquery
    //= require jquery_ujs
    //= require bootstrap
    //= require turbolinks
    //= require_tree .

### Add SSL in production
    config/environments/production.rb
    config.force_ssl = true

### SSL min_cost
    ActiveModel::SecurePassword.min_cost = true

### params
Объект params в приложениях Rails содержит все аргументы, переданные в запросе браузера.
id пользователя доступен в переменной params[:id]


### regex
    http://www.rubular.com/
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

## rails console

### Генерация случайных последовательностей:
    ('a'..'z').to_a.shuffle[0..7].join

### admin?
    rails console
    user = User.first
    user.admin?
    user.toggle!(:admin)
    user.admin?

### sqlite3 select
    sqlite3 -line db/development.sqlite3 "select * from users"

### Окружения Rails
Дефолтным окружением для Rails консоли является development:
    $ rails console
    Loading development environment
    >> Rails.env
    => "development"
    >> Rails.env.development?
    => true
    >> Rails.env.test?
    => false

    $ rails console test
    Loading test environment
    >> Rails.env
    => "test"
    >> Rails.env.test?
    => true

    $ rails server --environment production
    $ bundle exec rake db:migrate RAILS_ENV=production

    $ heroku run console
    Ruby console for yourapp.herokuapp.com
    >> Rails.env
    => "production"
    >> Rails.env.production?
    => true

### rails console --sandbox
    rails console --sandbox
    user = User.new(name: "admin", email: "admin@example.com")

### User.create
    rails console
    User.create(name: "admin", email: "admin@example.com", password: "admin", password_confirmation: "admin")
    User.create(name: "example", email: "example@railstutorial.org", password: "example", password_confirmation: "example")
    User.create(name: "test", email: "test@test.com", password: "test", password_confirmation: "test")

### user.update_attributes
    rails console
    user = User.first
    user = User.find_by(email: "example@railstutorial.org")
    user.update_attributes(name: "admin",
                           email: "admin@admin.com",
                           password: "admin",
                           password_confirmation: "admin")

    Заметьте, что save также имеет способность пропустить валидации,
    если как передать validate: false как аргумент. Этот способ нужно использовать осторожно.

    save(validate: false)

### rails generate
    rails generate controller FooBars baz quux
    rails destroy  controller FooBars baz quux

    rails generate model Foo bar:string baz:integer
    rails destroy model Foo

### список иднтификаторов из связанной таблицы
    User.first.followed_users.map { |i| i.id }
    User.first.followed_users.map(&:id)
    User.first.followed_user_ids
    => [4, 5, 6, 7, 8, 9,..., 48, 49, 50, 51]

### rake db:migrate
    rake db:migrate
    rake db:rollback
    Для того чтобы откатить к самому началу (все миграции), мы можем использовать
    rake db:migrate VERSION=0

    bundle exec rake db:migrate
    bundle exec rake db:rollback
    bundle exec rake test:prepare

### bundle exec rspec
    bundle exec rspec spec/requests/static_pages_spec.rb

### rails generate
    rails generate controller StaticPages home help about --no-test-framework
    rails generate controller Sessions --no-test-framework
    rake routes

    rails generate migration add_index_to_users_email
    rails generate migration add_password_digest_to_users password_digest:string
    rails generate migration add_remember_token_to_users
    rails generate migration add_admin_to_users admin:boolean
    rails generate migration add_index_to_orders_user_id

    add_index :users, :email, unique: true
    add_index :microposts, [:user_id, :created_at]
    add_index :orders, [:user_id, :created_at]
    add_index :orders, [:reader_id, :updated_at]

    rails generate model Micropost content:string user_id:integer
    rails generate model Relationship follower_id:integer followed_id:integer

    rails generate integration_test authentication_pages

### Пример rake db:migrate
    bundle exec rake db:migrate
    bundle exec rake db:reset
    bundle exec rake db:populate
    bundle exec rake db:postulate
    bundle exec rake db:relations
    bundle exec rake test:prepare
    bundle exec rake db:user_orders

### Базовые типы
     user_id:       integer
     admin:         boolean
     content:       string
     start_date:    datetime
     price:         decimal, precision: 8, scale: 2

### Настройка Action Mailer для Gmail
Action Mailer теперь использует гем Mail,
нужно добавить в файл config/environments/$RAILS_ENV.rb:
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address:              'smtp.gmail.com',
        port:                 587,
        domain:               'example.com',
        user_name:            '<username>',
        password:             '<password>',
        authentication:       'plain',
        enable_starttls_auto: true  }

### scaffold Order

    rails generate scaffold Order \
    user_id:integer reader_id:integer \
    order_status:string contract_date:datetime \
    abonent:string address:string \
    phone:string phone_mobile:string \
    connection_date:datetime \
    inet_tariff_plan:string inet_device_contract:string inet_installment_plan:integer \
    iptv_tariff_plan:string iptv_device_contract:string iptv_installment_plan:integer \
    passport_series:string passport_number:string \
    passport_registration_date:datetime passport_issued_by:string \
    date_of_birth:datetime place_of_birth:string

    rake db:migrate
    rake db:rollback
    rails destroy scaffold Order