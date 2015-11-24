require 'rails_helper'

EXCLUDED_MODELS = %w(ActiveAdmin::Comment AdminUser Ecm::Pictures::PictureGallery Ecm::Pictures::Picture Ecm::Pictures::AttachedPicture)

describe 'ActiveRecord::Base models' do
  ActiveRecord::Base.descendants.map(&:to_s).reject { |m| EXCLUDED_MODELS.include?(m) }.each do |model_name|
    model = model_name.constantize
    describe model do
      it 'should be an ActiveRecord::Base' do
        expect(ActiveRecord::Base.descendants).to include(model)
      end

      it 'should be instanciable' do
        instance = model.new
        expect(instance).to be_a(model)
      end

      it 'should be valid with correct attribute values' do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.tr('/', '_'))
        expect(instance.valid?).to be_truthy
      end

      it 'should not be valid with empty attributes' do
        instance = model.new
        expect(instance.valid?).to be_falsey
      end

      it 'should save with valid attributes' do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.tr('/', '_'))
        expect(instance.save).to be_truthy
        expect(instance).to be_persisted
      end
    end
  end
end
