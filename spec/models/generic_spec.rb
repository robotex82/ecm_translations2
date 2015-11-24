require 'rails_helper'

describe 'ActiveRecord::Base models', type: :model do
  ActiveRecord::Base.descendants.map(&:to_s).reject { |m| %w(ActiveAdmin::Comment AdminUser I18n::Backend::ActiveRecord::Translation).include?(m) }.each do |model_name|
    model = model_name.constantize
    describe model do
      it 'should be an ActiveRecord::Base' do
        ActiveRecord::Base.descendants.should include(model)
      end

      it 'should be instanciable' do
        instance = model.new
        instance.should be_a model
      end

      it 'should be valid with correct attribute values' do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.tr('/', '_'))
        instance.should be_valid
      end

      it 'should not be valid with empty attributes' do
        instance = model.new
        instance.should_not be_valid
      end

      it 'should save with valid attributes' do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.tr('/', '_'))
        instance.save.should be_truthy
        instance.should be_persisted
      end
    end
  end
end
