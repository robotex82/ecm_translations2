# This migration comes from ecm_translations_engine (originally 2)
class AddUniqueIndexToLocaleAndKeyOnEcmTranslationsTranslations < ActiveRecord::Migration[4.2]
  def change
    add_index(:ecm_translations_translations, [:locale, :key], unique: true)
  end
end
