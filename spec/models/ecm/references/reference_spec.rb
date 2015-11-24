require 'rails_helper'

module Ecm::References
  describe Reference do
    describe 'associations' do
      it { should belong_to :category }
    end # describe 'associations'

    describe 'friendly id' do
      subject { FactoryGirl.create(:ecm_references_reference, name: 'A reference with a friendly id!') }

      it 'should be generate from its name' do
        subject.to_param.should eq('a-reference-with-a-friendly-id')
      end # it
    end # describe 'friendly id'

    describe 'markup' do
      subject do
        FactoryGirl.build(
          :ecm_references_reference,
          description: 'h1. This is the description'
        )
      end # subject

      it 'should use textile as default markup language' do
        subject.description.to_html.should eq('<h1>This is the description</h1>')
      end # it
    end # describe 'markup'

    describe 'public methods' do
      describe '#preview_picture' do
        subject { FactoryGirl.create(:ecm_references_reference_with_pictures) }

        it 'should return the first picture' do
          subject.preview_picture.should eq(subject.pictures.first)
        end
      end # describe '#preview_picture'

      describe '#preview_picture_image_url' do
        describe 'for a reference without attached picture' do
          subject { FactoryGirl.create(:ecm_references_reference) }

          it 'should return nil' do
            subject.preview_picture_image_url.should eq(nil)
          end
        end # describe 'for a reference without attached picture'
      end # describe '#preview_picture_image_url'

      describe '#to_s' do
        subject { FactoryGirl.create(:ecm_references_reference, name: 'Example reference') }

        it 'should return a human readable label' do
          subject.to_s.should eq('Example reference')
        end # it
      end # describe '#to_s'
    end # describe 'public methods'

    describe 'published' do
      describe 'with new_references_published_by_default enabled' do
        before do
          Ecm::References::Configuration.new_references_published_by_default = true
        end # before

        describe 'as a new reference' do
          subject { FactoryGirl.build(:ecm_references_reference) }

          it 'should be published by default' do
            subject.published?.should be(true)
          end # it
        end # describe 'as a new reference'
      end # describe 'with new_references_published_by_default enabled'

      describe 'with new_references_published_by_default disabled' do
        before do
          Ecm::References::Configuration.new_references_published_by_default = false
        end # before

        describe 'as a new reference' do
          subject { FactoryGirl.build(:ecm_references_reference) }

          it 'should be published by default' do
            subject.published?.should be(false)
          end # it
        end # describe 'as a new reference'
      end # describe 'with new_references_published_by_default disabled'
    end # describe 'published'

    describe 'ranking' do
      describe 'as a single entry' do
        subject { FactoryGirl.create(:ecm_references_reference) }

        it 'should be the first entry' do
          subject.first?.should eq(true)
        end # it

        it 'should be the last entry' do
          subject.last?.should eq(true)
        end # it
      end # describe 'as a single entry'
    end # describe 'ranking'

    describe 'validations' do
      it { should validate_presence_of(:ecm_categories_category_id) }
      it { should validate_presence_of(:markup_language) }
      it { should validate_inclusion_of(:markup_language).in_array(Ecm::References::Configuration.markup_languages.map(&:to_s)) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).scoped_to(:ecm_categories_category_id) }
    end # describe 'validations'
  end # describe Reference
end # module Ecm::References
