class CreateEcmTranslationsTranslations < ActiveRecord::Migration[4.2]
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
