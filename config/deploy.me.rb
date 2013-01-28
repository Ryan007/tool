require 'rvm/capistrano'
require 'bundler/capistrano'
# require "whenever/capistrano"


set :rails_env, 'production'
set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p125@rails3.2.11'
set :rvm_path, '/home/ryan/.rvm/'
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"
set :deploy_via, :remote_cache

set :bundle_cmd, "/home/ryan/.rvm/gems/ruby-1.9.3-p125@rails3.2.11/bin/bundle"
set :passenger_cmd,  "#{bundle_cmd} exec passenger"
set :rake, "/home/ryan/.rvm/gems/ruby-1.9.3-p125@rails3.2.11/bin/rake"
set :normalize_asset_timestamps, false

set :application, "www.tool.com"
set :repository,  "git@github.com:Ryan007/tool.git"
set :scm, :git


role :web, "www.tool.com"                          # Your HTTP server, Apache/etc
role :app, "www.tool.com"                          # This may be the same as your `Web` server
role :db,  "www.tool.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
# set :port, 22223
set :use_sudo, true

# set :sudo, 'rvmsudo'
# set :sudo_prompt, 'password: '
# set :password, '1q2w3e4r'
# set :whenever_command, "bundle exec whenever"
set :user, "ryan"
# set :web_user, "nobody"
default_run_options[:pty] = true


set :branch, "master"
set :deploy_to, "/home/ryan/www/tool/www.tool.com/htdocs/#{application}"


set :keep_releases, 5

# 这些是为了替换一些正式环境的配置
task :symlink_database_yml do
  run "rm #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
end

# 设置定时执行任务的task
task :update_crontab, :roles => :web, :except => { :no_release => true } do
  run "cd #{release_path} && rvmsudo whenever --update-crontab"
end

# after "bundle:install", "symlink_database_yml"
# after "bundle:install", "update_crontab"

namespace :deploy do
  task :start, :roles => :web, :except => { :no_release => true } do
    run "cd /opt/nginx/sbin && #{try_sudo} ./nginx"
  end
  task :stop, :roles => :web, :except => { :no_release => true } do
    run "/opt/nginx/sbin && #{try_sudo} ./nginx -s stop"
  end
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "cd /opt/nginx/sbin && #{try_sudo} ./nginx -s reload"
    run "cd /opt/nginx/sbin && #{try_sudo} ./nginx -s stop"
    run "cd /opt/nginx/sbin && #{try_sudo} ./nginx"
  end
end

# 常用的任务
# $ cap deploy:setup
# $ cap deploy
# $ cap deploy:migrate
# $ cap deploy:migrations