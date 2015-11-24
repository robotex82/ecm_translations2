module Ecm::Translations
  class Translation < ActiveRecord::Base
    # validations
    validates :locale, presence: true
    validates :key,    presence: true, uniqueness: { scope: :locale }
  end
end
