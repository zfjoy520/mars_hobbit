I18n.load_path = Dir[File.join('config', 'locales', '*.{rb,yml}').to_s]
I18n.enforce_available_locales = false
I18n.default_locale = 'en'
