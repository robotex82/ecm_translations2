# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :i18n_backend_active_record_translation, class: 'I18n::Backend::ActiveRecord::Translation' do
    locale 'de'
    sequence(:key) { |i| "translation.#{i}" }
  end
end
