require 'i18n/backend/active_record'
if I18n::Backend::ActiveRecord::Translation.table_exists?
  backends = [I18n::Backend::ActiveRecord.new, I18n.backend]
  # actual_backend   = I18n.backend
  # database_backend = I18n::Backend::ActiveRecord.new
  if Ecm::Translations::Configuration.prefer_database_translations
    I18n.backend = I18n::Backend::Chain.new(*backends)
  else
    I18n.backend = I18n::Backend::Chain.new(*backends.reverse)
  end
end