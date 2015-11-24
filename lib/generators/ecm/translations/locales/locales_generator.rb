module Ecm
  module Translations
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc 'Copies the locale files to your application'

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_locales
          copy_file 'en.yml', 'config/locales/ecm.translations.en.yml'
          copy_file 'de.yml', 'config/locales/ecm.translations.de.yml'
        end
      end
    end
  end
end
