https://github.com/railstutorial/sample_app_rails_4

как отправлять почту с помощью Rails
http://railscasts.com/episodes/206-action-mailer-in-rails-3

отправить ссылку на форму сброса пароля
http://railscasts.com/episodes/274-remember-me-reset-password

Подтверждение регистрации
функция должна создавать пользователей в неактивном состоянии,
отправлять по email пользователям активационный URL,
а затем активировать статус пользователя при посещении соответствующего URL
https://www.ruby-toolbox.com/categories/state_machines
http://gistflow.com/posts/679-state-machine-with-rails-basics

RSS канал
http://railscasts.com/episodes/87-generating-rss-feeds

REST API
подразумевает добавление respond_to блоков ко многим действиям Application контроллера;
они должны отвечать на запросы для XML

Поиск
http://railscasts.com/episodes/37-simple-search-form
http://devcenter.heroku.com/articles/full-text-search
http://pat.github.io/thinking-sphinx/

Доступные адаптеры баз данных
приведены ссылки на веб-страницы, где они могут быть найдены.
DB2
http://raa.ruby-lang.org/project/ruby-db2 или http://rubyforge.org/projects/rubyibm
Firebird
http://rubyforge.org/projects/fireruby/
MySQL
http://www.tmtm.org/en/mysql/ruby/
Oracle
http://rubyforge.org/projects/ruby-oci8
Postgres
https://bitbucket.org/ged/ruby-pg/wiki/Home
Server
https://github.com/rails-sqlserver SQL
SQLite
https://github.com/luislavena/sqlite3-ruby
Адаптеры MySQL и SQLite также можно загрузить в виде RubyGems
(соответственно, mysql2 и sqlite3).

rails new sample_app
cd '/home/user/Repositories/Ruby_Projects/sample_app'
cd '/home/user/Projects/sample_app'

gem 'uglifier', '>= 1.3.0'
устанавливает последнюю версию гема uglifier
даже если его последняя версия значительно отличается от 1.3.0
даже если это, скажем, версия 7.2.

gem 'coffee-rails', '~> 4.0.0'
устанавливает гем coffee-rails с версией не старее чем 4.0.0, но не новее чем 4.1

sudo apt-get install nodejs

bundle install --without production
bundle update
bundle install

bundle show [gemname]
bundle show rails

bash --login запускает консоль Bash и перечитывает файлы персональной инициализации (типа ~/.profile)

rvm install 2.1.2
gem install rails

rails -v
ruby -v
rvm use 2.1.2

rails s

rails server
http://localhost:3000/

# Настройка репозиория GIT
git config --global user.email "wouldyougo@gmail.com"
git config --global user.name "wouldyougo"
git config --global --list

#Create a new repository on the command line
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/wouldyougo/sample_app.git
git push -u origin master

#Push an existing repository from the command line
git remote add origin https://github.com/wouldyougo/sample_app.git
git push -u origin master

###############
git init
git add .
git commit -m "Initial commit"
git mv README.rdoc README.md
git mv HOWTO.MD HOWTO.md
git mv TODO.MD TODO.md
git mv dev_log.txt log.md
git commit -am "Improve the README"

git remote add origin https://github.com/<username>/sample_app.git
git remote add origin https://github.com/wouldyougo/sample_app.git
git push -u origin master

#пропустил
Листинг 3.2. Динамическая генерация секретного токена.
config/initializers/secret_token.rb

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

$ cd ~/myapp
heroku create
git push heroku master
heroku run rake db:migrate

Я рекомендую регулярно пушить и деплоить ваш пример приложения в процессе чтения учебника:
git push
git push heroku
heroku run rake db:migrate

heroku logs

при использовании Git, хорошей практикой является делать нашу работу в отдельной, а не в master ветке
git checkout -b static-pages

rails generate controller StaticPages home help about --no-test-framework

#Пример
$ rails generate controller FooBars baz quux
$ rails destroy  controller FooBars baz quux

rails generate model Foo bar:string baz:integer
rails destroy model Foo

rake db:migrate
rake db:rollback
Для того чтобы откатить к самому началу (все миграции), мы можем использовать
rake db:migrate VERSION=0

rails server
http://localhost:3000/
http://localhost:3000/

git add .
git commit -m "Add a StaticPages controller"

bundle exec rspec spec/requests/static_pages_spec.rb

$ git add .
$ git commit -m "Finish static pages"

Затем объедините изменения с мастер веткой

$ git checkout master
$ git merge static-pages

$ git push
$ git push heroku

git checkout -b filling-in-layout

следует объединить изменения с мастер-веткой:
$ git add .
$ git commit -m "Finish layout and routes"
$ git checkout master
$ git merge filling-in-layout

Также вы можете отправить изменения на GitHub:
$ git push
Наконец, вы можете развернуть приложение на Heroku:
$ git push heroku

heroku open
Если столкнулись с проблемами, попробуйте выполнить
$ heroku logs

git checkout master
$ git checkout -b modeling-users


bundle exec rake db:migrate
bundle exec rake db:rollback

rails console --sandbox

user = User.new(name: "admin", email: "admin@example.com")

http://www.rubular.com/

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

rails generate migration add_index_to_users_email

bundle exec rake db:migrate

rails generate migration add_password_digest_to_users password_digest:string

bundle exec rake db:migrate
bundle exec rake test:prepare

rails console
User.create(name: "admin", email: "admin@example.com", password: "admin", password_confirmation: "admin")
User.create(name: "example", email: "example@railstutorial.org", password: "example", password_confirmation: "example")
User.create(name: "test", email: "test@test.com", password: "test", password_confirmation: "test")

rails console
user = User.first
user = User.find_by(email: "example@railstutorial.org")
user.update_attributes(name: "admin",
                       email: "admin@admin.com",
                       password: "admin",
                       password_confirmation: "admin")


git checkout master
git checkout -b sign-up


#Окружения Rails
#Дефолтным окружением для Rails консоли является development:
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
  
  
  ActiveModel::SecurePassword.min_cost = true
  
  bundle exec rake db:reset
  bundle exec rake test:prepare
  
git add .
git commit -m "Finish user signup"
git checkout master
git merge sign-up

config/environments/production.rb
config.force_ssl = true

git commit -a -m "Add SSL in production"
git push heroku

git commit -a -m "Add files"

heroku run rake db:migrate
heroku open
heroku logs

git checkout -b sign-in-out

rails generate controller Sessions --no-test-framework
$ rails generate integration_test authentication_pages

rake routes

rails generate migration add_remember_token_to_users

bundle exec rake db:migrate
bundle exec rake test:prepare

# select
sqlite3 -line db/development.sqlite3 "select * from users"

#app/assets/javascripts/application.js

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


git add .
git commit -m "Finish sign in"
git checkout master
git merge sign-in-out

Нужно лишь перейти по адресу 
http://localhost:3000/rails/info/routes

git checkout -b updating-users

#id пользователя доступен в переменной params[:id]
#Объект params в приложениях Rails содержит все аргументы, переданные в запросе браузера.    


bundle exec rake db:reset
bundle exec rake db:populate
bundle exec rake test:prepare

rails generate migration add_admin_to_users admin:boolean

bundle exec rake db:migrate
bundle exec rake test:prepare


rails console
user = User.first
user.admin?
user.toggle!(:admin)
user.admin?

git add .
git commit -m "Finish user edit, update, index, and destroy actions"
git checkout master
git merge updating-users

git push heroku
heroku pg:reset DATABASE
heroku pg:reset DATABASE --confirm fierce-waters-1951
heroku run rake db:migrate
heroku run rake db:populate
#Для того чтобы увидеть изменения вам возможно придется принудительно рестартовать приложение на Heroku:
heroku restart

git checkout -b user-microposts

rails generate model Micropost content:string user_id:integer

bundle exec rake db:migrate
bundle exec rake test:prepare

Метод	Назначение
micropost.user	Возвращает объект User связанный с данным микросообщением.
user.microposts	Возвращает массив микросообщений пользователя.
user.microposts.create(arg)	Создает микросообщение (user_id = user.id).
user.microposts.create!(arg)	Создает микросообщение (бросает исключение в случае неудачи).
user.microposts.build(arg)	Возвращает новый объект Micropost (user_id = user.id).

HTTP запрос	URL	Действие	Назначение
POST	/microposts	create	создание нового микросообщения
DELETE	/microposts/1	destroy	удаление микросообщения с id 1

bundle exec rake db:reset
bundle exec rake db:populate
bundle exec rake test:prepare

bundle exec rake db:postulate

git add .
git commit -m "Add user microposts"
git checkout master
git merge user-microposts
git push

git push heroku
heroku pg:reset DATABASE
heroku pg:reset DATABASE --confirm fierce-waters-1951
heroku run rake db:migrate
heroku run rake db:populate
heroku run rake db:postulate
heroku restart

git config --global user.email "wouldyougo@gmail.com"
git config --global user.name "wouldyougo"

git checkout -b following-users
Перешел к новой ветке 'following-users'


rails generate model Relationship follower_id:integer followed_id:integer

class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end

bundle exec rake db:migrate

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  .
  .
  .
end

class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  .
  .
  .
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  .
  .
  .
end

bundle exec rake db:relations

SampleApp::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  .
  .
  .
end

HTTP request	URL	Действие	Именованный маршрут
GET	/users/1/following	following	following_user_path(1)
GET	/users/1/followers	followers	followers_user_path(1)

Rails делает реализацию Ajax легкой, заменим
form_for на
form_for ..., remote: true

User.first.followed_users.map { |i| i.id }
User.first.followed_users.map(&:id)
User.first.followed_user_ids
 => [4, 5, 6, 7, 8, 9,..., 48, 49, 50, 51]

git config --global user.email "wouldyougo@gmail.com"
git config --global user.name "wouldyougo"

git add .
git commit -m "Add user following"
git checkout master
git merge following-users

Как обычно, если хотите, вы можете также отправить ваше приложение и развернуть его на сервере:
git push
git push heroku
heroku pg:reset DATABASE
heroku run rake db:migrate
heroku run rake db:populate
heroku run rake db:postulate
heroku run rake db:relations


git add .
git commit -m "Начало локализации"
