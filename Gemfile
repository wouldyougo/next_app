#source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
#gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#----------------------------------------------------------
#gem 'sinatra', '~> 1.4.4'
#gem 'thin'

##gem 'uglifier', '>= 1.3.0'
##устанавливает последнюю версию гема uglifier
##даже если его последняя версия значительно отличается от 1.3.0
##даже если это, скажем, версия 7.2.
##gem 'coffee-rails', '~> 4.0.0'
##устанавливает гем coffee-rails с версией не старее чем 4.0.0, но не новее чем 4.1

#----------------------------------------------------------

source 'https://rubygems.org'
ruby '2.1.2'

##ruby-gemset=railstutorial_rails_4_0

gem 'rails', '>= 4.1.1'

gem 'sass-rails', '>= 4.0.3'
##gem 'bootstrap-sass', '>= 3.1.1.1'
gem 'bootstrap-sass', '2.3.2.0'
##gem 'sass-rails', '>= 3.2'
##gem 'bootstrap-sass', '~> 3.1.1'

gem 'will_paginate', '>= 3.0.5'
gem 'bootstrap-will_paginate', '>= 0.0.10'

gem 'bcrypt'
##gem 'bcrypt-ruby', '>= 3.1.5'
gem 'faker', '>= 1.3.0'

gem 'uglifier', '>= 2.5.1'
gem 'coffee-rails', '>= 4.0.1'
gem 'jquery-rails', '>= 3.0.4'
gem 'turbolinks', '>= 1.1.1'
gem 'jbuilder', '>= 2.1.1'

##gem 'rails', '4.1.1'
##gem 'bootstrap-sass', '2.3.2.0'
##gem 'bcrypt-ruby', '3.1.2'
##gem 'faker', '1.1.2'
##gem 'will_paginate', '3.0.4'
##gem 'bootstrap-will_paginate', '0.0.9'

##gem 'rails', '~> 4.1.1'
##gem 'bootstrap-sass', '~> 2.3.2.0'
##gem 'bcrypt-ruby', '~> 3.1.2'
##gem 'faker', '~> 1.1.2'
##gem 'will_paginate', '~> 3.0.4'
##gem 'bootstrap-will_paginate', '~> 0.0.9'

#gem 'sass-rails', '4.0.3'
#gem 'uglifier', '2.1.1'
#gem 'coffee-rails', '4.0.1'
#gem 'jquery-rails', '3.0.4'
#gem 'turbolinks', '1.1.1'
#gem 'jbuilder', '2.0.0'

#gem 'sass-rails', '~> 4.0.3'
#gem 'uglifier', '~> 2.1.1'
#gem 'coffee-rails', '~> 4.0.1'
#gem 'jquery-rails', '~> 3.0.4'
#gem 'turbolinks', '~> 1.1.1'
#gem 'jbuilder', '~> 2.0.0'

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'rspec-rails', '>= 3.0.1'
  ##gem 'rspec-rails', '2.13.1'

  # The following optional lines are part of the advanced setup.
  # gem 'guard-rspec', '2.5.0'
  # gem 'spork-rails', '4.0.0'
  # gem 'guard-spork', '1.5.0'
  # gem 'childprocess', '0.3.6'
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'

  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  #gem 'capistrano-rvm'
end

group :test do
  #Using database_cleaner 1.3.0 from git://github.com/bmabey/database_cleaner.git (at master)
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  gem 'selenium-webdriver', '>= 2.42.0'
  gem 'capybara',  '>= 2.3.0'
  gem 'factory_girl_rails', '>= 4.4.1'

  #gem 'selenium-webdriver', '2.35.1'
  #gem 'capybara', '2.1.0'
  #gem 'factory_girl_rails', '4.2.0'
  #gem 'cucumber-rails', '1.4.0', :require => false

  # Uncomment this line on OS X.
  # gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.2'
  # gem 'wdm', '0.1.0'
end

group :doc do
  #gem 'sdoc', '0.3.20', require: false
  #gem 'sdoc', '~> 0.4.0'
  gem 'sdoc', '>= 0.4.0', require: false
end

#group :production do
#  gem 'pg', '0.15.1'
#  gem 'rails_12factor', '0.0.2'
#end

group :production do
  gem 'mysql2'
  #gem 'therubyracer'
  gem 'rails_12factor', '0.0.2'
end

group :staging do
  gem 'sqlite3'
  #gem 'mysql2'
  #gem 'therubyracer'
end
