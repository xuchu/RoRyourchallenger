# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'yourChallenger.com'
set :repo_url, 'git@github.com:frouds/RoRyourchallenger.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/RoRyourchallenger/'

# Default value for :scm is :git
set :scm, :git

set :user, "vnc"

set :stages, :production
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5


namespace :deploy do

  # the :linked_files above can make it
  #desc "Symlink shared config files"
  #task :symlink_config_files  do
  #  on roles(:web)  do
  #    execute "ln -nfs #{ deploy_to } shared/config/database.yml #{ release_path }/config/database.yml"
  #    execute "ln -nfs #{ deploy_to } shared/config/secret_token.rb #{ release_path }/config/initializers/secret_token.rb"
  #  end
  #end

  desc 'Restart application'
  task :restart do
    on roles(:web) do
      # Your restart mechanism here, for example:
      #execute "touch #{ File.join(current_path, 'tmp', 'restart.txt')}"
      execute "#{sudo} /etc/init.d/nginx restart"
    end
  end

  #after :publishing, :symlink_config_files
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web)  do
      # Here we can do anything such as:
      within release_path do
         execute :rake, 'cache:clear'
      end
    end
  end

end
