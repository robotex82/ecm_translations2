ActiveAdmin.register Ecm::Translations::Translation do
  menu parent: proc { I18n.t('activeadmin.menu.ecm.translations') }.call

  permit_params :interpolations,
                :is_proc,
                :key,
                :locale,
                :value

  scope :all, default: true
  I18n.available_locales.each do |locale|
    scope(locale) { |translation| translation.where(locale: locale) }
  end

  form do |f|
    f.inputs do
      f.input :locale, collection: I18n.available_locales.collect { |locale| [locale, locale] }
      f.input :key
      f.input :value
      f.input :interpolations
      f.input :is_proc
    end

    f.actions
  end

  index do
    selectable_column

    column :id
    column :locale
    column :key
    column :value
    column :interpolations
    column :is_proc
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :locale
      row :key
      row :value
      row :interpolations
      row :is_proc
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end