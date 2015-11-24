Ecm::Pictures.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ textile ]
  config.markup_languages = %w( textile )

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Paperclip options
  #
  # default:     config.paperclip_options = {
  #                styles: {
  #                  small_thumb:   "80x60",
  #                  medium_thumb:  "160x120",
  #                  default_thumb: "260x180"
  #                }
  #              }
  config.paperclip_options = {
    styles: {
      small_thumb:   '80x60',
      medium_thumb:  '160x120',
      default_thumb: '260x180'
    }
  }

  # Set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Adds <notextile> tags around the to fix html output.
  #
  # Default: config.prevent_textile_rendering_in_html = true
  #
  config.prevent_textile_rendering_in_html = true
end
