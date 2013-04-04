# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TwInOutWeb::Application.initialize!

Date::DATE_FORMATS[:day] = "%d/%m/%Y"
Time::DATE_FORMATS[:time] = "%H:%M"
