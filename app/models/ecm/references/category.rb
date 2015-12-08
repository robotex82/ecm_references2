module Ecm::References
  class Category < ActiveRecord::Base
    self.table_name = 'ecm_references_categories'

    # associations
    has_many :references, foreign_key: :ecm_references_category_id,
                          dependent:   :destroy

    # callbacks
    after_initialize :set_defaults
    before_validation :set_locale_from_parent
    before_save :update_locale_on_children!, if: proc { |category| category.locale_changed? }

    # default scope
    default_scope { order(:lft) }

    # friendly id support
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    # markup support
    acts_as_markup language: :variable, columns: [:description]

    # nested set support
    acts_as_nested_set

    # validations
    validates :locale, inclusion: I18n.available_locales.map(&:to_s), allow_blank: true
    validate :equality_of_locale_and_parent_locale, if: proc { |category| category.parent.respond_to?(:locale) }
    validates :markup_language, presence: true,
                                inclusion: Ecm::References::Configuration.markup_languages.map(&:to_s)
    validates :name, presence: true,
                     uniqueness: { scope: [:parent_id] }

    def self.localized
      where(locale: I18n.locale)
    end

    def self.with_public_visibility
      localized
    end

    def human
      name
    end

    def locale=(locale)
      write_attribute(:locale, locale.to_s) if locale.respond_to?(:to_s)
    end

    def locale_label(view)
      view.content_tag(:span, locale, class: 'label label-default')
    end

    def references_count
      references.count
    end

    def public_references_count
      references.with_public_visibility.count
    end

    def public_references_count_label(view)
      view.content_tag(:span, public_references_count, class: 'badge')
    end

    def to_s
      name
    end

    def tree_name
      name
    end

    private

    def equality_of_locale_and_parent_locale
      locale == parent.locale
    end

    def set_defaults
      if self.new_record?
        self.markup_language ||= Ecm::References::Configuration.default_markup_language
      end
    end

    def set_locale_from_parent
      self.locale = parent.locale if parent.respond_to?(:locale)
    end

    def update_locale_on_children!
      children.each do |child|
        child.locale = locale
        child.save!
      end
    end
  end
end
