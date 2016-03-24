module Ecm
  module Translations
    class CurrentTranslation
      include ActiveModel::Model
      include Enumerable::ActsAsResourceConcern
      include Enumerable::ActsAsPaginatableResourceConcern

      class Loader
        def load_translations(locale)
          @locale = locale
          raw_translations = backends.collect do |backend|
            load_translations_from(backend)
          end.reduce({}, :merge)
          process(raw_translations)
        end

        private

        def process(raw_translations)
          raw_translations.collect do |k, v|
            { key: k, value: v}
          end
        end

        def backends
          I18n.backend.send(:backends)
        end

        def load_translations_from(backend)
          return load_translations_from_memoized(backend) if backend.respond_to?(:memoized_lookup, true)
          return load_translations_from_simple(backend) if backend.respond_to?(:translations, true)
          {}
        end

        def load_translations_from_memoized(backend)
          translations = backend.send(:memoized_lookup)
          backend.flatten_translations(locale, translations, false, false)
        end

        def load_translations_from_simple(backend)
          backend.class.send(:include, I18n::Backend::Flatten) unless backend.respond_to?(:flatten_translations)
          backend.flatten_translations(locale, backend.send(:translations), false, false)
        end
        def locale
          I18n.locale
        end
      end

      attr_accessor :key, :value

      def self.collection
        Loader.new.load_translations(I18n.locale)
      end

      def self.attribute_names
        [:key, :value]
      end

      def to_param
        key
      end
    end
  end
end