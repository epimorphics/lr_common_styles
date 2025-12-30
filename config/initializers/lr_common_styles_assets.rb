# frozen_string_literal: true

# Only configure asset precompilation if Sprockets is available (Rails < 8 or explicit sprockets-rails)
if Rails.application.config.respond_to?(:assets)
  Rails.application.config.assets.precompile += %w[favicon/*]
end
