# frozen_string_literal: true

# Configuration initialiser for LR Common Styles gem
Rails.application.config.tap do |config|
  # Set the Google Analytics ID, if available
  # This can be set in the environment variables or left as old value
  # for backwards compatibility.
  config.google_analytics_id = ENV.fetch('GOOGLE_ANALYTICS_ID', 'UA-21165003-6')
end
