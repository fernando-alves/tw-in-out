require 'open-uri'

desc "This task is called by the Heroku cron add-on"
task :keep_alive do
  open("http://tw-in-out.herokuapp.com").read
end
