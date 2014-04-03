# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'yourChallenger.com'
set :repo_url, 'git@github.com:frouds/RoRyourchallenger.git'

set :deploy_to, '/var/www/RoRyourchallenger/'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }


# Default value for :scm is :git
set :scm, :git

set :user, "vnc"

set :stages, :production

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

end
