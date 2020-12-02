require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    @version = '0.0.0'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Krasnoyarsk'

    # Автозагрузка всех языковых файлов
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    # Дефолтовый язык
    config.i18n.default_locale = :ru

    # Возврат к английскому при ошибках
    config.i18n.fallbacks = [:en]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
