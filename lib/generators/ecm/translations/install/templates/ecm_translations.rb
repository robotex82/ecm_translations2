Ecm::Translations.configure do |config|
  # Whether to prefer translations from the database or not. If set to true,
  # translations coming from the database will override translations in yaml
  # files.
  # 
  # Default: config.prefer_database_translations = true
  config.prefer_database_translations = true
end
