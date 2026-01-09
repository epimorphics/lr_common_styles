# frozen_string_literal: true

module LrCommonStyles
  MAJOR = 3
  MINOR = 0
  PATCH = 0
  SUFFIX = nil # nil or 'rc' or 'beta' or 'alpha' for pre-release versions
  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX && "-#{SUFFIX}"}".freeze
end
