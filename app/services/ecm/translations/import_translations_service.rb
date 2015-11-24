module Ecm::Translations
  class ImportTranslationsService

    class TranslationInFileSystem
      attr_accessor :key, :locale, :raw_key, :value
      def initialize(raw_key, value)
        @raw_key, @value = raw_key, value
      end

      def human
        "#{locale} | #{@key}: #{@value}"
      end

      def key
        @raw_key.split(".").drop(1).join(".")
      end

      def locale
        @raw_key.split(".").first
      end

      def to_translation_attributes_hash
        {
          locale: locale,
          key: key,
          value: value,
          is_proc: false
        }
      end
    end

    def self.call(*args)
      new(*args).do_work
    end

    def initialize(options = {})
      options.reverse_merge!({ translations: load_translations_from_backends })
      @source_translations = options[:translations]
    end

    def do_work
      puts "Environment: #{Rails.env}"
      @translations = load_translations
      translations_count = @translations.size
      puts "Processing #{translations_count} translations:"
      @translations.each_with_index do |translation, index|
        puts "  (#{index + 1}/#{translations_count}) #{translation.human}"
        translation = Translation.new(translation.to_translation_attributes_hash)
        if translation.save
          puts "    Created #{translation.human}"
        else
          puts "    Could not create #{translation.human}. Errors: #{translation.errors.full_messages}"
        end
      end
    end

    private

    def load_translations
      self.class.to_dotted_hash(@source_translations).collect { |key, value| TranslationInFileSystem.new(key, value) }
    end

    def load_translations_from_backends
      if I18n.backend.respond_to?(:translations)
        I18n.backend.send(:init_translations) unless backend.initialized?
        return I18n.backend.send(:translations)
      end

      if I18n.backend.respond_to?(:backends)
        return I18n.backend.backends.reject{ |backend| backend.class.name == 'I18n::Backend::ActiveRecord' }.collect do |backend|
          backend.send(:init_translations) unless backend.initialized?
          backend.send(:translations)
        end.reduce({}, :merge)
      end
    end
    # def load_translations_raw
    #   I18n.backend.backends.reject{ |backend| backend.class == I18n::Backend::ActiveRecord }.collect do |backend|
    #     backend.send(:init_translations) unless backend.initialized?
    #     backend.send(:translations)
    #   end.reduce({}, :merge)
    # end

    def self.to_dotted_hash(hash, recursive_key = "")
      hash.each_with_object({}) do |(k, v), ret|
        key = recursive_key + k.to_s
        if v.is_a? Hash
          ret.merge! to_dotted_hash(v, key + ".")
        else
          ret[key] = v
        end
      end
    end
  end
end