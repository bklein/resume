namespace :locales do
  desc "Builds and installs locales, since my vps doesn't seem to have defaults"
  task :install do
    run "#{sudo} locale-gen en_US en_US.UTF-8"
    run "#{sudo} dpkg-reconfigure locales"
  end

  after "deploy:install", "locales:install"
end
