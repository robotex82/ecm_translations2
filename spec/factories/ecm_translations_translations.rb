# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_translations_translation, class: Ecm::Translations::Translation do
    locale 'de'
    sequence(:key) { |i| "translation.#{i}" }
  end
end
