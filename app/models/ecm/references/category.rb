module Ecm::References
  class Category < ActiveRecord::Base
    self.table_name = 'ecm_references_categories'

    # associations
    has_many :references, :foreign_key => :ecm_categories_category_id

    # attributes
    # attr_accessible :description,
    #                 :locale,
    #                 :markup_language,
    #                 :name,
    #                 :parent_id,
    #                 :slug

    # callbacks
    after_initialize :set_defaults
    before_validation :set_locale_from_parent
    before_save :update_locale_on_children!, :if => Proc.new { |category| category.locale_changed? }

    # default scope
    default_scope { order(:lft) }

    # friendly id support
    extend FriendlyId
    friendly_id :name, :use => :slugged

    # markup support
    acts_as_markup :language => :variable, :columns => [ :description ]

    # nested set support
    acts_as_nested_set

    # validations
    validates :locale, :inclusion => I18n.available_locales.map(&:to_s), :allow_blank => true
    validate :equality_of_locale_and_parent_locale, :if => Proc.new { |category| category.parent.respond_to?(:locale) }
    validates :markup_language, :presence => true,
                                :inclusion => Ecm::References::Configuration.markup_languages.map(&:to_s)
    validates :name, :presence => true,
                     :uniqueness => { :scope => [ :parent_id ] }

    def self.localized
      where(:locale => I18n.locale)
    end

    def self.with_public_visibility
      localized
    end

    def locale=(locale)
      write_attribute(:locale, locale.to_s) if locale.respond_to?(:to_s)
    end

    def reference_count
      references.count
    end

    def to_s
      name
    end # def

    private

    def equality_of_locale_and_parent_locale
      locale == parent.locale
    end # def

    def set_defaults
      if self.new_record?
        self.markup_language ||= Ecm::References::Configuration.default_markup_language
      end
    end # def

    def set_locale_from_parent
      self.locale = parent.locale if parent.respond_to?(:locale)
    end # def

    def update_locale_on_children!
      children.each do |child|
        child.locale = self.locale
        child.save!
      end
    end # def
  end # class Category < ActiveRecord::Base
end # module Ecm::References

