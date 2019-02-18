if ENV['SINATRA_ENV']
#in docker

  require 'sinatra/activerecord/rake'
  namespace :db do
    task :load_config do
      require "./app"
    end
  end

else
#in host

  desc "run 'db:migrate' in docker"
  task :migrate do
    sh("docker-compose run --rm web bundle exec rake db:migrate")
  end

  desc "run 'bash' in docker"
  task :bash  do |task, args|
    sh("docker-compose run --rm web /bin/bash")
  end

  desc "run 'pry' in docker"
  task :pry do
    sh("docker-compose run --rm web bundle exec pry")
  end

  desc "run docker"
  task :run do
    sh("docker-compose up -d")
  end
  desc "stop docker"
  task :stop do
    sh("docker-compose down")
  end
  desc "log docker"
  task :log do
    sh("docker-compose logs")
  end

  desc "run 'pry' in docker"
  task :ba do
    sh("docker-compose exec web /bin/bash")
  end

end
