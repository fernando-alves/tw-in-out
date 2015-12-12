# Thanks to @seanmarcia -> https://github.com/seanmarcia/pompeii/blob/master/config/initializers/secret_token.rb

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

TwInOutWeb::Application.config.secret_token = secure_token
