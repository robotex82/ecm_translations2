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

  index do
    selectable_column

    row :id
    row :locale
    row :key
    row :value
    row :interpolations
    row :is_proc
    row :created_at
    row :updated_at

    actions
  end
end