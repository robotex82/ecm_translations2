require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Translations
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :prefer_database_translations do
        true
      end
    end
  end
end
