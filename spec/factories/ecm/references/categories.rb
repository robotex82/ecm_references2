# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_references_category, :class => Ecm::References::Category do
    locale 'en'
    sequence(:name) { |i| "Reference category ##{i}" }

    factory :ecm_references_category_with_parent do
      locale nil
      association :parent, :factory => :ecm_references_category
    end

    factory :ecm_references_category_with_descendants do
      after_build do |category|
        category.children << FactoryGirl.build(:ecm_references_category, :parent => category)
        category.children.first.children << FactoryGirl.build(:ecm_references_category, :parent => category.children.first)
      end

      after_create do |category|
        # category.descendants.each { |descendant| descendant.save! }
        category.children.first.save!
        category.children.first.children.first.save!
      end
    end
  end
end

