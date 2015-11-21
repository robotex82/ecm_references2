Ecm::References.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  config.markup_languages = %w[ markdown rdoc textile ]

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
end

