require 'i18n/backend/active_record'

I18n.backend = I18n::Backend::Chain
.new(I18n::Backend::ActiveRecord.new, I18n.backend) # if I18n::Backend::ActiveRecord::Translation.table_exists?

module I18n
  module Backend
    class Chain
      def translations
        t = {}
        backends.reverse_each do |backend|
          t.deep_merge! backend.send(:translations)
        end
        t
      end
    end
  end
end

module I18n
  module Backend
    class ActiveRecord
      attr_reader :translations

      def initialize(*args)
        super(*args)
        reload!
      end

      def reload!
        @translations = load_translations
      end

      private

      def load_translations
        begin
          translations = Translation.locale(I18n.locale).all
        rescue ::ActiveRecord::StatementInvalid => e
          p e
          return {}
        end
          t = {}
          translations.each do |translation|
            nested_key = expand_keys(translation.key).last
            t.deep_merge! nested_key.split('.').reverse.inject(translation.value) { |a, n| { n => a } }
          end
          t
      end

      class Translation < ::ActiveRecord::Base
        self.table_name = 'ecm_translations_translations'

        validates :locale, presence: true
        validates :key, presence: true, uniqueness: { scope: :locale }

        # attr_accessible :locale, :key, :value
      end
    end
  end
end
