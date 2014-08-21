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

    rails console staging

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
    rake db:rollback STEP=3

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

    rails destroy model Relationship
    rails destroy controller Relationships
    rails destroy view Relationships

    rails destroy model Micropost
    rails destroy controller Microposts
    rails destroy view Microposts

    rails destroy scaffold Order

### Пример rake db:migrate

    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:populate
    bundle exec rake db:postulate
    bundle exec rake db:relations
    bundle exec rake test:prepare
    bundle exec rake db:user_orders

### Установка базы даных
    Задача rake db:setup создаст базу данных, загрузит схему и инициализирует ее с помощью данных seed.
    rake db:setup

### Сброс базы данных
    bundle exec rake db:reset

    Задача db:reset удалит базу данных и установит ее заново. Функционально это эквивалентно rake db:drop db:setup
    Это не то же самое, что запуск всех миграций. Оно использует только текущее содержимое файла schema.rb.
    Если миграция не может быть откачена, 'rake db:reset' может не помочь вам.

    rake db:drop
    rake db:setup

### Сброс базы данных - использование
    bundle exec rake db:reset RAILS_ENV="production"
    bundle exec rake db:drop RAILS_ENV="production"
    bundle exec rake db:setup RAILS_ENV="production"

    bundle exec rake db:create RAILS_ENV="production"

    bundle exec rake db:migrate RAILS_ENV="production"
    bundle exec rake db:populate RAILS_ENV="production"
    bundle exec rake db:user_orders RAILS_ENV="production"

    bundle exec rake db:migrate RAILS_ENV=staging
    bundle exec rake db:populate RAILS_ENV=staging
    bundle exec rake db:user_orders RAILS_ENV=staging

### Базовые типы
     user_id:       integer
     admin:         boolean
     content:       string
     start_date:    datetime
     price:         decimal, precision: 8, scale: 2

### rails dbconsole
    rails dbconsole
    rails db

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

### rake -T
    rake -T
    rake about                              # List versions of all Rails frameworks and the environment
    rake assets:clean[keep]                 # Remove old compiled assets
    rake assets:clobber                     # Remove compiled assets
    rake assets:environment                 # Load asset compile environment
    rake assets:precompile                  # Compile all the assets named in config.assets.precompile
    rake cache_digests:dependencies         # Lookup first-level dependencies for TEMPLATE (like messages/show or comments/_comment.html)
    rake cache_digests:nested_dependencies  # Lookup nested dependencies for TEMPLATE (like messages/show or comments/_comment.html)
    rake db:create                          # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:create:all to create all databases in the config)
    rake db:drop                            # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:drop:all to drop all databases in the config)
    rake db:fixtures:load                   # Load fixtures into the current environment's database
    rake db:migrate                         # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
    rake db:migrate:status                  # Display status of migrations
    rake db:populate                        # Fill database with sample data
    rake db:rollback                        # Rolls the schema back to the previous version (specify steps w/ STEP=n)
    rake db:schema:cache:clear              # Clear a db/schema_cache.dump file
    rake db:schema:cache:dump               # Create a db/schema_cache.dump file
    rake db:schema:dump                     # Create a db/schema.rb file that is portable against any DB supported by AR
    rake db:schema:load                     # Load a schema.rb file into the database
    rake db:seed                            # Load the seed data from db/seeds.rb
    rake db:setup                           # Create the database, load the schema, and initialize with the seed data (use db:reset to also drop the database first)
    rake db:structure:dump                  # Dump the database structure to db/structure.sql
    rake db:version                         # Retrieves the current schema version number
    rake doc:app                            # Generate docs for the app -- also available doc:rails, doc:guides (options: TEMPLATE=/rdoc-template.rb, TITLE="Custom Title")
    rake log:clear                          # Truncates all *.log files in log/ to zero bytes (specify which logs with LOGS=test,development)
    rake middleware                         # Prints out your Rack middleware stack
    rake notes                              # Enumerate all annotations (use notes:optimize, :fixme, :todo for focus)
    rake notes:custom                       # Enumerate a custom annotation, specify with ANNOTATION=CUSTOM
    rake rails:template                     # Applies the template supplied by LOCATION=(/path/to/template) or URL
    rake rails:update                       # Update configs and some other initially generated files (or use just update:configs or update:bin)
    rake routes                             # Print out all defined routes in match order, with names
    rake secret                             # Generate a cryptographically secure secret key (this is typically used to generate a secret for cookie sessions)
    rake spec                               # Run all specs in spec directory (excluding plugin specs)
    rake spec:controllers                   # Run the code examples in spec/controllers
    rake spec:helpers                       # Run the code examples in spec/helpers
    rake spec:mailers                       # Run the code examples in spec/mailers
    rake spec:models                        # Run the code examples in spec/models
    rake spec:requests                      # Run the code examples in spec/requests
    rake spec:routing                       # Run the code examples in spec/routing
    rake spec:views                         # Run the code examples in spec/views
    rake stats                              # Report code statistics (KLOCs, etc) from the application
    rake test                               # Runs test:units, test:functionals, test:generators, test:integration together
    rake test:all                           # Run tests quickly by merging all types and not resetting db
    rake test:all:db                        # Run tests quickly, but also reset db
    rake time:zones:all                     # Displays all time zones, also available: time:zones:us, time:zones:local -- filter with OFFSET parameter, e.g., OFFSET=-6
    rake tmp:clear                          # Clear session, cache, and socket files from tmp/ (narrow w/ tmp:sessions:clear, tmp:cache:clear, tmp:sockets:clear)
    rake tmp:create                         # Creates tmp directories for sessions, cache, sockets, and pids

### типы данных в rails generate scaffold
    rails generate scaffold ModelName [field:type, field:type]

    Rails	    db2	            mysql	        openbase	    Oracle
    :binary	    blob(32678)	    blob	        object	        blob
    :boolean	decimal(1)	    tinyint(1)	    boolean	        number(10)
    :date	    date	        date	        date	        date
    :datetime	timestamp	    datetime	    datetime	    date
    :decimal	decimal	        decimal	        decimal	        decimal
    :float	    float	        float	        float	        number
    :integer	int	            int(11)	        integer	        number(38)
    :string	    varchar(255)	varchar(255)	char(4096)	    varchar2(255)
    :text	    clob(32768)	    text	        text	        clob
    :time	    time	        time	        time	        date
    :timestamp	timestamp	    datetime	    timestamp	    date

    Rails	    postgresql	    sqlite	        sqlserver	    Sybase
    :binary	    bytea	        blob	        image	        image
    :boolean	boolean	        boolean	        bit	            bit
    :date	    date	        date	        datetime	    datetime
    :datetime	timestamp	    datetime	    datetime	    datetime
    :decimal	decimal	        decimal	        decimal	        decimal
    :float	    float	        float	        float(8)	    float(8)
    :integer	integer	        integer	        int	            int
    :string     *               varchar(255)	varchar(255)	varchar(255)
    :text	    text	        text	        text	        text
    :time	    time	        datetime	    datetime	    time
    :timestamp	timestamp	    datetime        datetime	    timestamp
