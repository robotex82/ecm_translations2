# This migration comes from ecm_translations_engine (originally 1)
class CreateEcmTranslationsTranslations < ActiveRecord::Migration
  def change
    create_table :ecm_translations_translations do |t|
      t.string :locale
      t.string :key
      t.text :value
      t.text :interpolations
      t.boolean :is_proc, default: false

      t.timestamps
    end
  end
end
