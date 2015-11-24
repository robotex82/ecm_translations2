module Ecm::Translations
  class Translation < ActiveRecord::Base

    # validations
    validates :locale, presence: true
    validates :key,    presence: true, uniqueness: { scope: :locale }

    after_save do
      I18n.reload!
    end

    def human
      "#{self.class.model_name.human}: #{locale} | #{key}: #{value}"
    end
  end
end
