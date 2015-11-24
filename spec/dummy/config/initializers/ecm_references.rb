Ecm::References.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ textile ]
  config.markup_languages = %w( textile )

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Controls if new references are marked as published by default when created
  #
  # default: config.new_references_published_by_default = false
  config.new_references_published_by_default = false

  # Number of characters to render in reference preview
  #
  # default: config.news_preview_length = 250
  config.reference_preview_length = 250

  # Set the css classes for the categories table
  #
  # Default: config.categories_table_classes = 'table table-striped table-hover'
  #
  config.categories_table_classes = 'table table-striped table-hover'

  # Set the css classes for the references table
  #
  # Default: config.references_table_classes = 'table table-striped table-hover'
  #
  config.references_table_classes = 'table table-striped table-hover'

  # Set the base controller
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # CSS Classes for the preview container div
  #
  # Default: config.reference_preview_div_classes = 'media ecm-reference bottom-margin-2'
  #
  config.reference_preview_div_classes = 'media ecm-reference bottom-margin-2'

  # CSS Classes for the preview thumbnail link
  #
  # Default: config.reference_preview_thumbnail_link_classes = 'col-lg-4'
  #
  config.reference_preview_thumbnail_link_classes = 'col-lg-4'

  # Number of lines to render in news preview
  #
  # default: config.news_item_preview_lines = 3
  config.reference_preview_lines = 3
end
