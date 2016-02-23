module Ecm::Translations
  class Translation < ActiveRecord::Base
    # scopes
    scope :not_translated, -> { where(value: nil) }
    scope :is_proc, -> { where(is_proc: true) }

    # validations
    validates :locale, presence: true
    validates :key,    presence: true, uniqueness: { scope: :locale }

    after_save do
      I18n.reload!
    end

    after_destroy do
      I18n.reload!
    end

    def human
      "#{self.class.model_name.human}: #{locale} | #{key}: #{value}"
    end
  end
end
