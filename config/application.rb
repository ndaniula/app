require_relative 'boot'
require 'rails/all'
require 'google/apis/calendar_v3'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onguard
  class Application < Rails::Application
  # config.web_console.whiny_requests = false
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.paths.add File.join("app", "bot"), glob: File.join("**","*.rb")
    config.autoload_paths += Dir[Rails.root.join("app", "bot", "*")]
    config.time_zone = 'Singapore'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
