#HOWTO

##GIT

###Create a new repository on the command line
    touch README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/wouldyougo/next_app.git
    git push -u origin master

###Push an existing repository from the command line
    git remote add origin https://github.com/wouldyougo/next_app.git
    git push -u origin master

### Настройка репозиория GIT
    git config --global user.email "user_email@gmail.com"
    git config --global user.name "wouldyougo"
    git config --global --list

## Ruby on Rails

###Документация:
* Please feel free to use a different markup language if you do not plan to run
  <tt>rake doc:app</tt>.
* Для создания документации в HTML-формате можно воспользоваться следующей командой rake:
  <tt>rake doc:app</tt>.
* Объем созданного программного кода:
    rake stats

###Генерация случайных последовательностей:
    ('a'..'z').to_a.shuffle[0..7].join

###Локализация
В файлах application.rb по умолчанию есть инструкция,
как добавлять локали из другой директории,
и как настраивать другую локаль по умолчанию.

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

###rails console --sandbox
    rails console --sandbox
    user = User.new(name: "admin", email: "admin@example.com")

###User.create
    rails console
    User.create(name: "admin", email: "admin@example.com", password: "admin", password_confirmation: "admin")
    User.create(name: "example", email: "example@railstutorial.org", password: "example", password_confirmation: "example")
    User.create(name: "test", email: "test@test.com", password: "test", password_confirmation: "test")

###user.update_attributes
    rails console
    user = User.first
    user = User.find_by(email: "example@railstutorial.org")
    user.update_attributes(name: "admin",
                           email: "admin@admin.com",
                           password: "admin",
                           password_confirmation: "admin")

###rails server
    rails server
    http://localhost:3000/

###rails generate
    rails generate controller FooBars baz quux
    rails destroy  controller FooBars baz quux

    rails generate model Foo bar:string baz:integer
    rails destroy model Foo












