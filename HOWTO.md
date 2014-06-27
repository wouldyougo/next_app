#HOWTO

##GIT

###Create a new repository on the command line
    touch README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/<username>/next_app.git
    git remote add origin https://github.com/wouldyougo/next_app.git
    git push -u origin master

###Push an existing repository from the command line
    git remote add origin https://github.com/<username>/next_app.git
    git remote add origin https://github.com/wouldyougo/next_app.git
    git push -u origin master

### Настройка репозиория GIT
    git config --global user.email "user_email@gmail.com"
    git config --global user.name "wouldyougo"
    git config --global --list

### git init
    git init

### git commit
    git add .
    git commit -m "Initial commit"
    git mv README.rdoc README.md
    git commit -am "Improve the README"
    ...
    git commit -am "Add files"

### git push
Так вы можете отправить изменения на GitHub:
    git remote add origin https://github.com/wouldyougo/next_app.git
    git push -u origin master


### Работа в отдельной ветке
При использовании Git, хорошей практикой является делать изменения в отдельной ветке,
а не в master ветке. Перешел к новой ветке 'static-pages':
    git checkout -b static-pages

    git add .
    git commit -m "Finish static pages"

Затем объедините изменения с мастер веткой:
    git checkout master
    git merge static-pages

Затем  вы можете отправить изменения на GitHub и heroku:
    git push
    git push heroku

## heroku
### Регистрация на Heroku
Первый шаг это регистрация на Heroku;
после подтверждения вашего email для завершения создания вашего аккаунта,
установите необходимый для Heroku софт с помощью Heroku Toolbelt:
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    $ heroku login
    Enter your Heroku credentials.
    Email: wouldyougo@gmail.com
    Password:
    Could not find an existing public key.
    Would you like to generate one? [Yn]
    Generating new SSH public key.
    Uploading ssh public key /Users/adam/.ssh/id_rsa.pub

### Развертывание на Heroku
    $ cd ~/myapp
    heroku create
    git push heroku master
    heroku run rake db:migrate

Так вы можете развернуть приложение на сервере Heroku:
    git push heroku
    heroku pg:reset DATABASE
    heroku pg:reset DATABASE --confirm fierce-waters-1951
    heroku run rake db:migrate
    heroku run rake db:populate
    heroku run rake db:postulate
    heroku run rake db:relations

### heroku restart
Для того чтобы увидеть изменения вам возможно придется принудительно рестартовать приложение на Heroku:
    heroku restart
    heroku open
Если столкнулись с проблемами, попробуйте выполнить
    heroku logs

### clone git@heroku

    git clone git@heroku.com:fierce-waters-1951.git
    git remote remove origin
    git remote add heroku git@heroku.com:fierce-waters-1951.git

###Пример использования git и heroku
    git checkout master
    git checkout -b static-pages
    git add .
    git commit -am "Finish static pages"
    git checkout master
    git merge static-pages
    git push
    git push heroku

    heroku pg:reset DATABASE
    heroku pg:reset DATABASE --confirm fierce-waters-1951
    heroku run rake db:migrate
    heroku run rake db:populate
    heroku run rake db:postulate
    heroku run rake db:relations
    heroku restart
    heroku open

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
    bundle update
    bundle install

    bundle show [gemname]
    bundle show rails

###rails server
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


###Документация:
* Please feel free to use a different markup language if you do not plan to run
  <tt>rake doc:app</tt>.
* Для создания документации в HTML-формате можно воспользоваться следующей командой rake:
  <tt>rake doc:app</tt>.
* Объем созданного программного кода:
    rake stats

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

###Генерация случайных последовательностей:
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

###rails generate
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