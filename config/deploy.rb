require 'rvm/capistrano'
require 'bundler/capistrano'
require "whenever/capistrano"


set :rails_env, 'production'
set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p125@rails328_listen'
set :rvm_path, '/usr/local/rvm/'
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"
set :deploy_via, :remote_cache

set :bundle_cmd, "/usr/local/rvm/gems/ruby-1.9.3-p125@global/bin/bundle"
set :passenger_cmd,  "#{bundle_cmd} exec passenger"
set :rake, "/usr/local/rvm/gems/ruby-1.9.3-p125@rails328_listen/bin/rake"
set :normalize_asset_timestamps, false
# set :default_environment, {
#   'PATH'            => "/usr/local/rvm/gems/ruby-1.9.3-p125@rails328_listen/bin:
#       /usr/local/rvm/gems/ruby-1.9.3-p125@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p125/bin:
#       /usr/local/rvm/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.4.4:$PATH",
#   'RUBY_VERSION'    => '/usr/local/rvm/rubies/ruby-1.9.3-p125',
#   'GEM_HOME'        => "#{rvm_path}/gems/#{rvm_ruby_string}",
#   'GEM_PATH'        => "#{rvm_path}/gems/#{rvm_ruby_string}",
#   'BUNDLE_PATH'     => "#{rvm_path}/gems/#{rvm_ruby_string}"
# }

set :application, "inc.tools.xiaoma.com"
set :repository,  "git@github.com:Ryan007/tool.git"
set :scm, :git


role :web, "inc.tools.xiaoma.com"                          # Your HTTP server, Apache/etc
role :app, "inc.tools.xiaoma.com"                          # This may be the same as your `Web` server
role :db,  "inc.tools.xiaoma.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
set :port, 22229
set :use_sudo, true
set :user, "wch"
set :web_user, "nobody"
default_run_options[:pty] = true


set :branch, "master"
set :deploy_to, "/home/wch/www/tool/inc.tools.xiaoma.com/htdocs/#{application}"


set :keep_releases, 5

# 这些是为了替换一些正式环境的配置
task :symlink_database_yml do
  run "rm #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
end

# 设置定时执行任务的task
task :update_crontab, :roles => :db do
  run "cd #{release_path} && #{try_rvmsudo} whenever --update-crontab"
end

after "bundle:install", "symlink_database_yml"
after "bundle:install", "update_crontab"

namespace :deploy do
  task :start, :roles => :web, :except => { :no_release => true } do 
    run "cd #{current_path} && bundle exec passenger start --socket /tmp/inc.tools.xiaoma.com.socket -d -e production --pid-file /tmp/tool.pid"
  end
  task :stop, :roles => :web, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec passenger stop --pid-file /tmp/tool.pid"
  end
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "cd #{current_path} && #{passenger_cmd} stop --pid-file /tmp/tool.pid"
    run "cd #{current_path} && #{passenger_cmd} start --socket /tmp/inc.tools.xiaoma.com.socket -d -e production --pid-file /tmp/tool.pid"
  end
end

# 常用的任务
# $ cap deploy:setup
# $ cap deploy
# $ cap deploy:migrate
# $ cap deploy:migrations