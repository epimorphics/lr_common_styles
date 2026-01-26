# frozen_string_literal: true

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
