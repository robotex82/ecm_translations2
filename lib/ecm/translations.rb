require 'ecm/translations/configuration'

module Ecm
  module Translations
    extend Configuration

    def self.table_name_prefix
      'ecm_translations_'
    end
  end
end
