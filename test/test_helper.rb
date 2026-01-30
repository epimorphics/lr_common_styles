# frozen_string_literal: true

# Override Warning.warn to suppress specific dartsass-sprockets/sprockets method conflicts.
#
# These conflicts occur because dartsass-sprockets monkey-patches Sprockets' Sass integration
# to provide Dart Sass support. The warnings are harmless—both gems need to coexist for
# Bootstrap's Sass compilation during tests. Only suppresses these specific method conflicts:
# * +asset_data_url+ - Sass helper for data URLs
# * +initialize+ - Sass compressor initialization
# * +call+ - Sass compressor invocation
#
# @note This override only affects warnings during test execution and does not impact
#   consuming applications or production code.
module Warning
  SUPPRESSED_WARNINGS = [
    /dartsass-sprockets.*asset_data_url/,
    /dartsass-sprockets.*(initialize|call)/,
    /sprockets.*previous definition of (asset_data_url|initialize|call)/,
    /execjs.*method redefined; discarding old runtime/
  ].freeze

  def self.warn(message)
    return if SUPPRESSED_WARNINGS.any? { |pattern| pattern.match?(message) }

    super
  end
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../test/dummy/config/environment.rb', __dir__)

require 'simplecov'
SimpleCov.start do
  add_filter '/test/dummy/config/'
end

# Removed link to rails/test_help since it's causing an error initialising
# ActiveRecord, which we don't need. So I've just transcluded the contents
# of that file
# require "rails/test_help"

require 'active_support/test_case'
require 'action_controller'
require 'action_controller/test_case'
require 'action_dispatch/testing/integration'
require 'rails/generators/test_case'

require 'minitest/rails'
require 'mocha/minitest'

require 'active_support/testing/autorun'

module ActionController
  class TestCase
    def before_setup # :nodoc:
      @routes = Rails.application.routes
      super
    end
  end
end

module ActionDispatch
  class IntegrationTest
    def before_setup # :nodoc:
      @routes = Rails.application.routes
      super
    end
  end
end

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('fixtures', __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.fixtures :all
end
