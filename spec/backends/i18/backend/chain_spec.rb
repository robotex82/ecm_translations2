require 'rails_helper'

describe I18n::Backend::Chain do
  it { expect(subject).to respond_to(:backends) }
end
