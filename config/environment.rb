# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Date::DATE_FORMATS[:day] = "%d/%m/%Y"
Time::DATE_FORMATS[:time] = "%H:%M"
