module Ecm
  module Translations
    class Engine < ::Rails::Engine
      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
      end

      initializer :ecm_translations_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(root, 'app/admin')
        end
      end
    end
  end
end
