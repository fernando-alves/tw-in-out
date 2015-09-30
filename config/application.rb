require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TwInOutWeb
  class Application < Rails::Application
    # config.autoload_paths << config.root.join("app/presenters").to_s
    config.time_zone = 'Brasilia'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
