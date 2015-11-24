# require 'i18n/active_record'
# require 'i18n/backend/active_record/translation'

require 'ecm/translations/engine'
require 'ecm/translations/configuration'
require 'ecm/translations/routing'

module Ecm
  module Translations
    def self.table_name_prefix
      'ecm_translations_'
    end

    extend Configuration
  end
end
