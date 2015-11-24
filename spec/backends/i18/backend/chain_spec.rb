require 'rails_helper'

describe I18n::Backend::Chain do
  it 'should respond to #translations' do
    expect(subject).to respond_to(:translations)
  end
end
