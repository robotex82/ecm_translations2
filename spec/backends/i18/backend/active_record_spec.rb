require 'rails_helper'

describe I18n::Backend::ActiveRecord do
  describe 'translations' do
    it 'should be a callable' do
      expect(subject).to respond_to(:translations)
    end

    it 'should return a hash' do
      expect(subject.translations).to be_a(Hash)
    end

    it 'should be lazy' do
      expect do
        translation = FactoryGirl.create(:i18n_backend_active_record_translation)
      end.not_to change { I18n.backend.translations.size }
    end

    it 'should return new translations after reload' do
      translation = FactoryGirl.create(:i18n_backend_active_record_translation)
      I18n.backend.reload!

      expect(I18n.backend.translations.size).to eq(1)
    end
  end
end
