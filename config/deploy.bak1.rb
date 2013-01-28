require 'rvm/capistrano'
require 'bundler/capistrano'

set :rails_env, 'production'
set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p125@rails3.2.11'
set :rvm_path, '/home/ryan/.rvm'
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"
set :deploy_via, :remote_cache

set :normalize_asset_timestamps, false
# set :default_environment, {
# 'PATH' => "#{rvm_path}/gems/ruby/1.9.1/bin:#{rvm_bin_path}/bin:$PATH",
# 'RUBY_VERSION' => '1.9.2',
# 'GEM_HOME' => "#{rvm_path}/gems/#{rvm_ruby_string}",
# 'GEM_PATH' => "#{rvm_path}/gems/#{rvm_ruby_string}",
# 'BUNDLE_PATH' => "#{rvm_path}/gems/#{rvm_ruby_string}"
# }

set :application, "www.tool.com"
set :repository, "git@github.com:Ryan007/tool.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


role :web, "www.tool.com" # Your HTTP server, Apache/etc
role :app, "www.tool.com" # This may be the same as your `Web` server
role :db, "www.tool.com", :primary => true # This is where Rails migrations will run
set :bundle_cmd, "/usr/local/rvm/gems/ruby-1.9.3-p125@global/bin/bundle"
set :passenger_cmd,  "#{bundle_cmd} exec passenger"
set :rake, "/usr/local/rvm/gems/ruby-1.9.3-p125@rails3211/bin/rake"
#role :db, "your slave db-server here"
set :port, 22223
set :use_sudo, true
set :user, "ryan"
# set :web_user, "nobody"
#set :password, "passwd"
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

# after "bundle:install", "symlink_database_yml"
# after "deploy:symlink", "custom:set_permissions_for_runtime"

namespace :deploy do
  task :start, :roles => :web, :except => { :no_release => true } do
    run "cd /etc/init.d && #{try_sudo} ./nginx start"
  end
  task :stop, :roles => :web, :except => { :no_release => true } do
    run "/etc/init.d && #{try_sudo} ./nginx stop"
  end
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "cd /etc/init.d && #{try_sudo} ./nginx restart"
  end
end


# 常用的任务
# $ cap deploy:setup
# $ cap deploy
# $ cap deploy:migrate
# $ cap deploy:migrations