require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.i18n.default_locale = :en
    #config.time_zone = 'Moscow'
    # config.eager_load_paths << Rails.root.join("extras")

    #Это метод подключения к автозагрузке сущьностей не из каталога app.
    # Сущности каталога app подгружаются автоматически
    # config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
