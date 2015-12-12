#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TwInOutWeb::Application.load_tasks

namespace :in_out do
  task :setup do
    system 'bundle exec rake db:create'
    system 'bundle exec rake db:migrate'
    system 'bundle exec rake db:test:prepare'
  end

  desc 'Starts app locally'
  task :start do
    system 'bundle exec foreman start -f Procfile.dev -p 3000'
  end
end
