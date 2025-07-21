# frozen_string_literal: true

module LrCommonStyles
  MAJOR = 2
  MINOR = 2
  PATCH = 2
  SUFFIX = nil # nil or 'rc' or 'beta' or 'alpha' for pre-release versions
  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX && "-#{SUFFIX}"}".freeze
end
