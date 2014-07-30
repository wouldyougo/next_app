require "rvm/capistrano"
require "bundler/capistrano"
require 'capistrano_colors'
load 'deploy/assets'

set :rvm_type, :system
set :application, "gap_app"
#set :repository, "git@github.com:your-username/your-repository-name.git"
set :repository, "/var/repos/gap_app.git"
#set :local_repository, "ssh://deploy@your-server-address/var/repos/store_app.git"
set :local_repository, "ssh://deploy@gap.lipetsk.ru:/var/repos/gap_app.git"
set :branch, "master"
set :user, "deploy"
set :deploy_via, :remote_cache
set :keep_releases, 3
set :scm, :git
set :use_sudo, false
#set :deploy_to, "/path/to/your/app"
#set :deploy_to, "/var/www/#{application}/production"
#set :rails_env, "production"
#set :branch, "master"
task :production do
  set :deploy_to, "/var/www/#{application}/production"
  set :rails_env, "production"
  set :branch, "master"
end
task :staging do
  set :deploy_to, "/var/www/#{application}/staging"
  set :rails_env, "staging"
  set :branch, "master"
end
# не забудьте добавить эту строку,
# она по умолчанию запускает деплой дляstaging
staging

#role :web, "your-server-address"
#role :app, "your-server-address"
#role :db, "your-server-address", :primary => true
role :web, "gap.lipetsk.ru"
role :app, "gap.lipetsk.ru"
role :db, "gap.lipetsk.ru", :primary => true

namespace :deploy do
  namespace :custom_symlinks do
    #desc "Symlink shared config files"
    #task :symlink_config_files do
    #  run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
    #end
    task :custom_configs do
      run "ln -nsf #{shared_path}/config/database.yml #{current_release}/config/"
    end
    task :user_files do
      run "ln -nsf #{shared_path}/public/uploads/ #{current_release}/public/"
    end
    task :default do
      user_files
      custom_configs
    end
  end
  task :start do ; end
  task :stop do ; end

  desc "Restart Passenger app"
  task :restart, :roles => :app,
       :except => { :no_release => true } do
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end

  #desc "cause Passenger to initiate a restart"
  #task :restart do
  #  run "touch #{current_path}/tmp/restart.txt"
  #end

  #desc "reload the database with seed data"
  #task :seed do
  #  run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  #end
end

namespace :migrate do
  task :default do
    run "cd #{current_release} bundle exec rake db:migrate"
  end
end
before "deploy:assets:precompile", "deploy:custom_symlinks"
after "deploy:update", "deploy:cleanup"

#after "deploy:update_code", :bundle_install
#desc "install the necessary prerequisites"
#task :bundle_install, :roles => :app do
#  run "cd #{release_path} && bundle install"
#end

#set :application, "YourApplicationName"
#set :repository, "git@github.com:your-username/your-repository-name.git"
##default location of /u/apps/#{ application }.
#set :deploy_to, "/path/to/your/app"
#set :scm, :git
#set :branch, "master"
#set :user, "bill"
#set :scm_passphrase, "password"
#set :use_sudo, false
#set :rails_env, "production"
#set :deploy_via, :copy
#set :ssh_options, { :forward_agent => true, :port => 4321 }
#set :keep_releases, 5
#default_run_options[:pty] = true
#server "www.example.com", :app, :web, :db, :primary => true
#role :web, "web.example.com"
#role :app, "app.example.com"
#role :db, "db.somethingelse.com", :primary => true


##set :application, "set your application name here"
##set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

##role :web, "your web-server here"                          # Your HTTP server, Apache/etc
##role :app, "your app-server here"                          # This may be the same as your `Web` server
##role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
##role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end