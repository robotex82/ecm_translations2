require 'rails_helper'

describe Ecm::Translations::Translation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :locale }
    it { should validate_presence_of :key }
    it { should validate_uniqueness_of(:key).scoped_to(:locale) }
    it { should respond_to(:human) }
  end
end
