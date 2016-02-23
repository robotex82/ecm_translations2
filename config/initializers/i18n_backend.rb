require 'i18n/backend/active_record'

class I18n::Backend::ActiveRecord::Translation
  self.table_name = 'ecm_translations_translations'
end

if I18n::Backend::ActiveRecord::Translation.table_exists?
  backends = [I18n::Backend::ActiveRecord.new, I18n.backend]

  I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
  I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Flatten)

  if Ecm::Translations::Configuration.prefer_database_translations
    I18n.backend = I18n::Backend::Chain.new(*backends)
  else
    I18n.backend = I18n::Backend::Chain.new(*backends.reverse)
  end
end
