Ecm::References.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ textile ]
  config.markup_languages = %w[ textile ]

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

  # Set the css classes for the downloads table
  #
  # Default: config.downloads_table_classes = 'table table-striped table-hover'
  #
  config.references_table_classes = 'table table-striped table-hover' 

  # Set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'
end

