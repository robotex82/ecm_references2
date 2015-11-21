require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm::References
  module Configuration
    def configure
      yield self
    end # def

    mattr_accessor :default_markup_language
    @@default_markup_language = nil

    mattr_accessor :markup_languages
    @@markup_languages = []

    mattr_accessor :new_references_published_by_default
    @@new_references_published_by_default = false

    mattr_accessor :reference_preview_length
    @@reference_preview_length = nil
  end # module Configuration
end # module Ecm::References

