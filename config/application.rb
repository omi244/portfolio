require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Baukis2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # TODO ==== 追加 [START] ===============================================
    # https://guides.rubyonrails.org/configuring.html
    # タイムゾーン と ロケール の設定
    config.time_zone = "Tokyo"
    config.i18n.load_path += 
      Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :ja

    # ソースコードの雛形生成を抑制する
    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false 
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end

    config.hosts << "localhost"
    # ========== 追加 [END] ================================================

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
