require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smk
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.initialize_on_precompile = true
    config.load_defaults 6.0
    config.time_zone =  "Asia/Jakarta"
    config.autoload = :classic
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
Rails.autoloaders.main.ignore("#{Rails.root}/app/overrides")