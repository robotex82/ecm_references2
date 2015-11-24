require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module References
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :default_markup_language
      @@default_markup_language = nil

      mattr_accessor :markup_languages
      @@markup_languages = []

      mattr_accessor :new_references_published_by_default
      @@new_references_published_by_default = false

      mattr_accessor :reference_preview_length
      @@reference_preview_length = nil

      mattr_accessor :categories_table_classes do
        ''
      end

      mattr_accessor :references_table_classes do
        ''
      end

      mattr_accessor :base_controller do
        'ApplicationController'
      end

      mattr_accessor :reference_preview_div_classes do
        ''
      end

      mattr_accessor :reference_preview_thumbnail_link_classes do
        ''
      end

      mattr_accessor :reference_preview_lines do
        ''
      end
    end
  end
end
