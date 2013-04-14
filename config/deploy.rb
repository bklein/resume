require 'bundler/capistrano'
require "rvm/capistrano"

%w[base nodejs nginx unicorn postgresql].each do |recipe|
  load "./config/recipes/#{recipe}"
end

load "deploy/assets"

server "198.46.149.43", :web, :app, :db, primary: true

set :application, "resume"

set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :branch, :capify
set :repository,  "git@github.com:bklein/#{application}.git"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :rvm_ruby_string, '1.9.3'               # use the same ruby as used locally for deployment
set :rvm_type, :user
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs
set :bundle_cmd, 'source $HOME/.bash_profile && source $HOME/.profile && bundle'

before 'deploy:install', 'rvm:install_rvm'   # install RVM
before 'deploy:install', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:install', 'rvm:create_gemset' # only create gemset

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
