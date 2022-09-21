require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Whattowatch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.frameworks -= [:active_record, :active_resource, :action_mailer] Tsrying to
    config.tmdb_url               = ENV['TMDB_URL']
    config.tmdb_api_key           = ENV['TMDB_API_KEY']
    config.tmbd_read_access_token = ENV['TMDB_READ_ACCESS_TOKEN']
  end
end
