require 'bundler/capistrano'

%w[rvm nodejs nginx postgresql].each do |recipe|
  load "./config/recipes/#{recipe}"
end

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

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"