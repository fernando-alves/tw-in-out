namespace :docker do
  desc 'Start docker-machine'
  task :start do
    system('./script/development/start_docker.sh')
  end
end
