namespace :rvm do
  desc "Install rvm and ruby 1.9.3"
  task :install, roles: :app do
    run "#{sudo} apt-get install -y git-core curl"
    run '\curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled --ruby=1.9.3'
    run "source /usr/local/rvm/scripts/rvm"
  end

  after "deploy:install", "rvm:install"
end
