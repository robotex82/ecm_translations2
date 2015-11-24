require 'rails_helper'

module Ecm::Translations
  describe ImportTranslationsService do
    before(:each) do
      @translations = {
        en: { car: 'car', parts: { door: 'door', tire: 'tire' } },
        de: { car: 'Auto', parts: { door: 'Tür', tire: 'Reifen' } },
        fr: { car: 'voiture', parts: { door: 'porte', tire: 'pneu' } },
        es: { car: 'auto', parts: { door: 'puera', tire: 'neumático' } }
      }
    end

    it { expect { ImportTranslationsService.call(translations: @translations) }.to change{ Ecm::Translations::Translation.count }.from(0).to(12) }

    describe 'the new translation' do
      before(:each) do
        ImportTranslationsService.call(translations: @translations )
      end
      subject { Ecm::Translations::Translation.first }

      it { expect(subject.key).to              eq('car') }
      it { expect(subject.value).to            eq('car') }
      it { expect(subject.interpolations).to   eq(nil) }
      it { expect(subject.is_proc).to          eq(false) }
    end
  end
end