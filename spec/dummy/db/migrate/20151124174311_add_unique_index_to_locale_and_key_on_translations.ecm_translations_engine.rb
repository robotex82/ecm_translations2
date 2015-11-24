# This migration comes from ecm_translations_engine (originally 2)
class AddUniqueIndexToLocaleAndKeyOnTranslations < ActiveRecord::Migration
  def change
    add_index(:translations, [:locale, :key], unique: true)
  end
end
