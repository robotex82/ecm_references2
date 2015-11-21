FactoryGirl.define do
  factory :ecm_references_reference, :class => Ecm::References::Reference do
    sequence(:name) { |i| "Reference ##{i}" }
    association :category, :factory => :ecm_references_category

    factory :ecm_references_reference_with_pictures do
      after_create { |reference| reference.pictures << FactoryGirl.create_list(:ecm_pictures_picture, 3) }
    end
  end
end

