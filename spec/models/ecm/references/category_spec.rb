require 'rails_helper'

module Ecm::References
  describe Category do
    before do
      I18n.available_locales = [ :en, :de ]
    end # before

    describe 'associations' do
      it { should have_many :references }
    end # describe 'associations'

    describe 'localization' do
      describe 'inheritance of locale' do
        describe 'for a new child category' do
          subject do
            FactoryGirl.build(:ecm_references_category_with_parent, :locale => nil)
          end
          it 'should have the same locale as the parent after save' do
            subject.save
            subject.locale.should eq(subject.parent.locale)
          end # it
        end # describe 'for a new child category'

        describe 'for a category with descendants' do
          subject do
            FactoryGirl.create(:ecm_references_category_with_descendants, :locale => 'en')
          end
          it 'should set the locale on the descendants after save' do
            subject.locale = 'de'
            subject.save
            subject.descendants.each do |category|
              category.locale.should eq(subject.locale)
            end
          end # it
        end # describe 'for a category with descendants'
      end # describe 'inheritance of locale'
    end # describe 'localization'

    describe 'nested set' do
      describe 'with a root node' do
        subject { FactoryGirl.build(:ecm_references_category) }

        it 'should be a root node' do
          subject.root?.should eq(true)
        end # it
      end # describe 'with a root node'
    end # describe 'nested set'

    describe 'friendly id' do
      subject { FactoryGirl.create(:ecm_references_category, :name => 'A category with a friendly id!') }

      it 'should be generate from its name' do
        subject.to_param.should eq('a-category-with-a-friendly-id')
      end # it
    end # describe 'friendly id'

    describe 'markup' do
      subject do
        FactoryGirl.build(
          :ecm_references_category,
          :description => 'h1. This is the description'
        )
      end # subject

      it 'should use textile as default markup language' do
        subject.description.to_html.should eq('<h1>This is the description</h1>')
      end # it
    end # describe 'markup'

    describe 'public methods' do
      describe '#to_s' do
        subject { FactoryGirl.create(:ecm_references_category, :name => 'Example category')  }

        it 'should return a human readable label' do
          subject.to_s.should eq('Example category')
        end # it
      end # describe '#to_s'
    end # describe 'public methods'

    describe 'scopes' do
      describe 'publicly_visible' do
        before do
          I18n.locale = :en
          @category_with_actual_locale = FactoryGirl.create(:ecm_references_category, :locale => 'en')
          @category_without_locale = FactoryGirl.create(:ecm_references_category, :parent => @category_with_actual_locale, :locale => nil)
          @category_with_different_locale = FactoryGirl.create(:ecm_references_category, :locale => 'de')
        end # before

        it 'should include categories with the actual locale' do
          Category.with_public_visibility.all.should include(@category_with_actual_locale)
        end # it
        it 'should include categories without locale' do
          Category.with_public_visibility.all.should include(@category_without_locale)
        end # it
        it 'should not include categories with other locales' do
          Category.with_public_visibility.all.should_not include(@category_with_different_locale)
        end # it
      end # describe 'publicly_visible'
    end # describe 'scopes'

    describe 'validations' do
      it { should ensure_inclusion_of(:locale).in_array(I18n.available_locales.map(&:to_s)) }
      it { should validate_presence_of(:markup_language) }
      it { should ensure_inclusion_of(:markup_language).in_array(Ecm::References::Configuration.markup_languages.map(&:to_s)) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
    end # describe 'validations'
  end # describe Category
end # module Ecm::References

