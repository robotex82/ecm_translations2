# This migration comes from ecm_translations_engine (originally 2)
class AddUniqueIndexToLocaleAndKeyOnEcmTranslationsTranslations < ActiveRecord::Migration
  def change
    add_index(:ecm_translations_translations, [:locale, :key], unique: true)
  end
end
