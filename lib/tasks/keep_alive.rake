require 'net/http'

desc "This task is called by the Heroku cron add-on"
task :keep_alive do
  Net::HTTP.get_response URI("https://tw-in-out.herokuapp.com")
end
