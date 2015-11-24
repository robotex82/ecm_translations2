class AddUniqueIndexToLocaleAndKeyOnTranslations < ActiveRecord::Migration
  def change
    add_index(:translations, [:locale, :key], unique: true)
  end
end
